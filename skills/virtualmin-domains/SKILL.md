---
name: virtualmin-domains
description: Create, list, modify, clone, rename, migrate and delete Virtualmin virtual servers
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/create-domain/
---

# Virtualmin Domains

Full lifecycle management of Virtualmin virtual servers (domains).

## When to Use

- Create or delete virtual servers
- Enable, disable, clone, or rename domains
- Modify domain settings, quota, bandwidth, web config
- Migrate domains from other control panels
- Manage redirects, ports, and domain features

## Available Scripts

| Script | Command | Description |
|--------|---------|-------------|
| `create-domain.sh` | `virtualmin create-domain` | Create a new virtual server |
| `delete-domain.sh` | `virtualmin delete-domain` | Delete a virtual server and all data |
| `clone-domain.sh` | `virtualmin clone-domain` | Duplicate an existing virtual server |
| `rename-domain.sh` | `virtualmin rename-domain` | Change domain name or username |
| `modify-domain.sh` | `virtualmin modify-domain` | Change domain parameters |
| `move-domain.sh` | `virtualmin move-domain` | Change owner of a virtual server |
| `migrate-domain.sh` | `virtualmin migrate-domain` | Import from another control panel |
| `transfer-domain.sh` | `virtualmin transfer-domain` | Move domain to another system |
| `enable-disable-domain.sh` | `virtualmin enable-domain / disable-domain` | Enable or disable a domain |
| `list-domains.sh` | `virtualmin list-domains` | List all virtual servers |
| `notify-domains.sh` | `virtualmin notify-domains` | Email domain owners |
| `validate-domains.sh` | `virtualmin validate-domains` | Check domain configuration |
| `enable-feature.sh` | `virtualmin enable-feature` | Turn on a feature for a domain |
| `disable-feature.sh` | `virtualmin disable-feature` | Turn off a feature for a domain |
| `reset-feature.sh` | `virtualmin reset-feature` | Reset a feature to default |
| `modify-web.sh` | `virtualmin modify-web` | Change web configuration |
| `syncmx-domain.sh` | `virtualmin syncmx-domain` | Update relay addresses |
| `unalias-domain.sh` | `virtualmin unalias-domain` | Convert alias to sub-server |
| `unsub-domain.sh` | `virtualmin unsub-domain` | Convert sub-domain to sub-server |
| `resend-email.sh` | `virtualmin resend-email` | Re-send signup email |
| `list-bandwidth.sh` | `virtualmin list-bandwidth` | Show bandwidth usage |
| `list-ports.sh` | `virtualmin list-ports` | List TCP ports for a domain |
| `list-redirects.sh` | `virtualmin list-redirects` | List web redirects |
| `create-redirect.sh` | `virtualmin create-redirect` | Add a web redirect |
| `delete-redirect.sh` | `virtualmin delete-redirect` | Remove a web redirect |
| `fix-domain-permissions.sh` | `virtualmin fix-domain-permissions` | Fix home directory permissions |
| `fix-domain-quota.sh` | `virtualmin fix-domain-quota` | Fix Unix quotas |

## Usage

```bash
sudo bash create-domain.sh --domain example.com --user myuser --pass secret --email admin@example.com
sudo bash list-domains.sh --name-only
sudo bash enable-feature.sh --domain example.com --feature ssl
sudo bash clone-domain.sh --domain source.com --newdomain clone.com
```

## Notes

- `delete-domain.sh` requires typing the domain name to confirm — irreversible
- `migrate-domain.sh` supports cPanel, Plesk, and Ensim backup formats
- Features: `web`, `dns`, `mail`, `mysql`, `ssl`, `ftp`, `spam`, `virus`
