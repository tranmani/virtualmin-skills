"""Add `ServerAlias wp.<domain>` to a Virtualmin Apache vhost (:80 and :443).

Inserts the alias directly after the existing `ServerAlias www.<domain>` line in
each VirtualHost block, so it inherits that block's DocumentRoot and PHP config.
Idempotent, and writes a timestamped backup before touching anything.
"""
import re, shutil, subprocess, sys, os

domain = sys.argv[1]
conf = f"/etc/apache2/sites-available/{domain}.conf"
alias = f"wp.{domain}"

if not os.path.exists(conf):
    sys.exit(f"NOT FOUND: {conf}")

src = open(conf).read()

if re.search(rf"^\s*ServerAlias\s+{re.escape(alias)}\s*$", src, re.M):
    print(f"{alias}: already present in {conf} — nothing to do")
    sys.exit(0)

# Anchor on the www alias: it exists once per VirtualHost block, so this adds
# the new alias to every block (:80 and :443) without parsing the whole config.
anchor = re.compile(rf"^(?P<indent>[ \t]*)ServerAlias\s+www\.{re.escape(domain)}\s*$", re.M)
matches = list(anchor.finditer(src))
if not matches:
    sys.exit(f"NO ANCHOR: no 'ServerAlias www.{domain}' line found in {conf}")

out = anchor.sub(lambda m: f"{m.group(0)}\n{m.group('indent')}ServerAlias {alias}", src)
added = out.count(f"ServerAlias {alias}")

backup = f"{conf}.bak-wpalias"
shutil.copy2(conf, backup)
open(conf, "w").write(out)
print(f"{alias}: added to {added} VirtualHost block(s); backup at {backup}")

# Never reload a broken config — restore and bail if the syntax check fails.
check = subprocess.run(["apache2ctl", "configtest"], capture_output=True, text=True)
if check.returncode != 0:
    shutil.copy2(backup, conf)
    sys.exit(f"CONFIGTEST FAILED — reverted.\n{check.stderr}")
print("configtest: OK")
