---
name: virtualmin-legacy-host
description: Expose a legacy site on an extra hostname (e.g. wp.domain.tld) after its apex has moved to another platform
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
---

# Virtualmin Legacy Host

Keep an old site reachable on a side hostname after its apex domain has been
cut over to something else (Cloudflare Workers, a new stack, another host).
Built for the case where the original WordPress must stay available to check
data, while the apex serves the replacement site.

## When to Use

- An apex domain was migrated away, but the old site still lives on this server
- You need `wp.domain.tld` (or `old.`, `legacy.`) pointing at the original vhost
- The legacy site must not compete with the new one in search results

## Available Scripts

| Script | Description |
|--------|-------------|
| `cf-add-subdomain.py` | Create a proxied Cloudflare A record for `wp.<domain>` |
| `add-web-alias.py` | Add `ServerAlias wp.<domain>` to the Virtualmin Apache vhost (:80 + :443) |
| `add-host-noindex.py` | Send `X-Robots-Tag: noindex` for that host only |
| `wp-legacy-host.py` | Make WordPress answer on the new host without editing its database |

All four are idempotent, take a timestamped `.bak-*` backup, and validate
(`apache2ctl configtest` / `php -l`) before leaving a change in place —
reverting automatically if validation fails.

## Order of Operations

```bash
CF_TOKEN=... python3 scripts/cf-add-subdomain.py example.com
sudo python3 scripts/add-web-alias.py example.com
sudo python3 scripts/add-host-noindex.py example.com     # after the alias
sudo systemctl reload apache2
sudo python3 scripts/wp-legacy-host.py example.com /home/example.com/public_html
```

## Gotchas Learned the Hard Way

- **Worker routes are hostname-exact.** A route of `example.com/*` does NOT match
  `wp.example.com`, so the subdomain reaches the origin. Check for `*.` wildcard
  routes first — those WOULD swallow it.
- **Cloudflare SSL mode `full` (not `strict`)** means the origin cert does not have
  to name the new subdomain; the existing vhost cert works and CF's universal cert
  covers one level of subdomain at the edge.
- **WordPress will 301 you away.** `siteurl`/`home` still point at the apex, so
  every hit bounces to the new site. `wp-legacy-host.py` defines `WP_HOME` /
  `WP_SITEURL` for that hostname only — the database is untouched, so reverting is
  just deleting the block.
- **Purge the CF cache afterwards.** That first 301 gets cached at the edge; until
  it is purged you keep getting redirected and will think the fix failed.
  `POST /zones/<id>/purge_cache {"hosts": ["wp.example.com"]}`
- **Virtualmin home dirs can be truncated.** `maquillagepermanentageneve.ch` lives
  in `/home/maquillagepermanentageneve` — read the real path from
  `virtualmin list-domains --domain X --multiline | grep "HTML directory"` rather
  than assuming `/home/<domain>`.
- **Test the origin against its real IP**, not `127.0.0.1` — the vhosts bind to the
  public IP, so a loopback request falls through to the Apache default vhost and
  looks like a failure.
- Consider Basic Auth on the legacy host if the old app is unpatched; these
  domains attract constant `xmlrpc.php` / `wp-login.php` bot traffic.
