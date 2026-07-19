"""Put HTTP Basic Auth on the legacy wp.<domain> host only.

The old WordPress admin is publicly reachable and these domains take constant
xmlrpc.php / wp-login.php bot traffic. The auth directives go INSIDE the existing
`<If "%{HTTP_HOST} == 'wp.<domain>'">` blocks, so the apex vhost in the same file
is untouched.

Applies to EVERY matching block. Virtualmin writes one VirtualHost for :80 and
another for :443, and Cloudflare talks to the origin over HTTPS — protecting only
the first block leaves the port that carries all the real traffic wide open.

Idempotent; backs up and configtests, reverting if the check fails.
"""
import os, re, shutil, subprocess, sys

domain = sys.argv[1]
htpasswd = sys.argv[2]
conf = f"/etc/apache2/sites-available/{domain}.conf"
host = f"wp.{domain}"
MARK = "# LEGACY-WP-AUTH"

if not os.path.exists(conf):
    sys.exit(f"NOT FOUND: {conf}")

src = open(conf).read()
if MARK in src:
    print(f"{host}: basic auth already present — nothing to do")
    sys.exit(0)

pat = re.compile(
    rf"^(?P<indent>[ \t]*)<If \"%\{{HTTP_HOST\}} == '{re.escape(host)}'\">\n"
    rf"(?:.*\n)*?"
    rf"(?P=indent)</If>",
    re.M,
)

n_blocks = len(pat.findall(src))
if n_blocks == 0:
    sys.exit(f"NO ANCHOR: no <If> block for {host} in {conf} — run add-host-noindex first")


def add_auth(m):
    indent = m.group("indent")
    inner = indent + "    "
    auth = (
        f"{inner}{MARK}\n"
        f"{inner}AuthType Basic\n"
        f'{inner}AuthName "Legacy site - authorised access only"\n'
        f"{inner}AuthUserFile {htpasswd}\n"
        f"{inner}Require valid-user\n"
    )
    return m.group(0).replace(f"{indent}</If>", auth + f"{indent}</If>")


out = pat.sub(add_auth, src)
applied = out.count(MARK)
if applied != n_blocks:
    sys.exit(f"REFUSING: matched {n_blocks} block(s) but only patched {applied}")

backup = f"{conf}.bak-wpauth"
shutil.copy2(conf, backup)
open(conf, "w").write(out)
print(f"{host}: basic auth added to {applied}/{n_blocks} block(s); backup at {backup}")

chk = subprocess.run(["apache2ctl", "configtest"], capture_output=True, text=True)
if chk.returncode != 0:
    shutil.copy2(backup, conf)
    sys.exit(f"CONFIGTEST FAILED — reverted.\n{chk.stderr}")
print("configtest: OK")
