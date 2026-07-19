"""Mark the legacy wp.<domain> host noindex.

The old WordPress is a near-duplicate of the freshly migrated site. Left
indexable it would compete with the new pages for the same queries, so every
response on the wp.* host carries X-Robots-Tag: noindex. Scoped with <If> on the
Host header, so the apex vhost (same file) is unaffected.
Idempotent; backs up and configtests before leaving anything in place.
"""
import os, re, shutil, subprocess, sys

domain = sys.argv[1]
conf = f"/etc/apache2/sites-available/{domain}.conf"
host = f"wp.{domain}"
MARK = f"# LEGACY-WP-NOINDEX {host}"

if not os.path.exists(conf):
    sys.exit(f"NOT FOUND: {conf}")

src = open(conf).read()
if MARK in src:
    print(f"{host}: noindex already present — nothing to do")
    sys.exit(0)

block_for = lambda indent: (
    f"\n{indent}{MARK}\n"
    f"{indent}<If \"%{{HTTP_HOST}} == '{host}'\">\n"
    f"{indent}    Header always set X-Robots-Tag \"noindex, nofollow, noarchive\"\n"
    f"{indent}</If>"
)

# Anchor on the alias line we added earlier: one per VirtualHost block.
anchor = re.compile(rf"^(?P<indent>[ \t]*)ServerAlias\s+{re.escape(host)}\s*$", re.M)
if not anchor.search(src):
    sys.exit(f"NO ANCHOR: 'ServerAlias {host}' not found — add the alias first")

out = anchor.sub(lambda m: m.group(0) + block_for(m.group("indent")), src)

backup = f"{conf}.bak-wpnoindex"
shutil.copy2(conf, backup)
open(conf, "w").write(out)
print(f"{host}: noindex added to {out.count(MARK)} block(s); backup at {backup}")

chk = subprocess.run(["apache2ctl", "configtest"], capture_output=True, text=True)
if chk.returncode != 0:
    shutil.copy2(backup, conf)
    sys.exit(f"CONFIGTEST FAILED — reverted.\n{chk.stderr}")
print("configtest: OK")
