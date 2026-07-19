"""Let WordPress answer on wp.<domain> without rewriting its database.

WP stores siteurl/home as https://<domain>; since that apex is now served by the
CF Worker, any hit to wp.<domain> gets 301'd to the new site and the old admin is
unreachable. Defining WP_HOME/WP_SITEURL for the wp.* host only overrides those
values per-request. The DB is untouched, so pointing the site back at the apex is
just a matter of deleting this block.

The host is compared against a hardcoded literal rather than trusting
HTTP_HOST for the value, so there is no header-injection surface.
"""
import os, shutil, sys

domain = sys.argv[1]
docroot = sys.argv[2]
conf = os.path.join(docroot, "wp-config.php")
host = f"wp.{domain}"
MARK = "LEGACY-WP-HOST"

if not os.path.exists(conf):
    sys.exit(f"NOT FOUND: {conf}")

src = open(conf).read()
if MARK in src:
    print(f"{host}: wp-config already patched — nothing to do")
    sys.exit(0)

block = f"""
/* {MARK}: reach the original WordPress at {host} after the apex moved to
   Cloudflare Workers. Overrides the siteurl/home stored in the database for
   this hostname only; the stored values are left untouched. Delete this block
   to revert. */
if (isset($_SERVER['HTTP_HOST']) && $_SERVER['HTTP_HOST'] === '{host}') {{
    define('WP_HOME',    'https://{host}');
    define('WP_SITEURL', 'https://{host}');
}}
"""

idx = src.find("<?php")
if idx == -1:
    sys.exit(f"NO <?php OPENING TAG in {conf}")
insert_at = idx + len("<?php")

backup = conf + ".bak-wphost"
shutil.copy2(conf, backup)
open(conf, "w").write(src[:insert_at] + "\n" + block + src[insert_at:])
print(f"{host}: wp-config patched; backup at {backup}")

# A syntax error here takes the whole site down — verify before leaving.
import subprocess
chk = subprocess.run(["php", "-l", conf], capture_output=True, text=True)
if chk.returncode != 0:
    shutil.copy2(backup, conf)
    sys.exit(f"PHP LINT FAILED — reverted.\n{chk.stdout}{chk.stderr}")
print("php -l: OK")
