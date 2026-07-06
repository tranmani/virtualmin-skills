---
name: virtualmin-other
description: Miscellaneous Virtualmin utilities — proxies, license, login links, shared IPs, logs, Dropbox, GCS, plugins and more
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/
---

# Virtualmin Other Utilities

Miscellaneous Virtualmin API commands that don't fit a single category.

## When to Use

- Generate one-time Virtualmin login links
- Manage shared IP addresses
- Enable/disable Apache access logging per domain
- Manage reverse proxies and load balancers
- Manage license keys
- Sync files with Dropbox or Google Cloud Storage
- Install or remove Virtualmin plugins
- Access domain logs, SSL info, and custom fields

## Available Scripts

### Proxies & Load Balancers
| Script | Command | Description |
|--------|---------|-------------|
| `create-proxy.sh` | `virtualmin create-proxy` | Add a reverse proxy to a domain |
| `delete-proxy.sh` | `virtualmin delete-proxy` | Remove a reverse proxy |
| `modify-proxy.sh` | `virtualmin modify-proxy` | Modify proxy settings |
| `list-proxies.sh` | `virtualmin list-proxies` | List all proxies |

### License Management
| Script | Command | Description |
|--------|---------|-------------|
| `get-license.sh` | `virtualmin license-info` | Show current license info |
| `install-license.sh` | `virtualmin upgrade-license` | Upgrade to Virtualmin Pro |
| `update-license.sh` | `virtualmin change-license` | Change license key |
| `revoke-license.sh` | `virtualmin downgrade-license` | Downgrade to GPL |

### Access & Networking
| Script | Command | Description |
|--------|---------|-------------|
| `create-shared-address.sh` | `virtualmin create-shared-address` | Add shared IP address |
| `delete-shared-address.sh` | `virtualmin delete-shared-address` | Remove shared IP address |
| `list-shared-addresses.sh` | `virtualmin list-shared-addresses` | List shared IP addresses |
| `create-login-link.sh` | `virtualmin create-login-link` | Generate one-time Virtualmin login URL |

### Logging
| Script | Command | Description |
|--------|---------|-------------|
| `enable-writelogs.sh` | `virtualmin enable-writelogs` | Enable Apache access logging |
| `disable-writelogs.sh` | `virtualmin disable-writelogs` | Disable Apache access logging |
| `get-logs.sh` | `virtualmin get-logs` | Output web server logs for a domain |

### Cloud Storage (Dropbox & GCS)
| Script | Command | Description |
|--------|---------|-------------|
| `download-dropbox-file.sh` | `virtualmin download-dropbox-file` | Download from Dropbox |
| `upload-dropbox-file.sh` | `virtualmin upload-dropbox-file` | Upload to Dropbox |
| `list-dropbox-files.sh` | `virtualmin list-dropbox-files` | List Dropbox files |
| `list-gcs-buckets.sh` | `virtualmin list-gcs-buckets` | List Google Cloud Storage buckets |
| `list-gcs-files.sh` | `virtualmin list-gcs-files` | List GCS files |

### Miscellaneous
| Script | Command | Description |
|--------|---------|-------------|
| `create-cron-job.sh` | — | Create a cron job for a domain |
| `delete-cron-job.sh` | — | Delete a domain cron job |
| `list-cron-jobs.sh` | — | List domain cron jobs |
| `get-ssl.sh` | `virtualmin get-ssl` | Output SSL certificate info |
| `get-command.sh` | `virtualmin get-command` | Show info about an API command |
| `send-email.sh` | — | Send email from a domain |
| `mass-update-domains.sh` | — | Bulk update domain settings |
| `install-plugin.sh` | — | Install a Virtualmin plugin |
| `delete-plugin.sh` | — | Remove a Virtualmin plugin |
| `list-plugins.sh` | — | List installed plugins |

## Usage

```bash
sudo bash create-login-link.sh --user admin
sudo bash get-logs.sh --domain example.com
sudo bash create-proxy.sh --domain example.com --path /api --url http://127.0.0.1:3000/
sudo bash list-shared-addresses.sh
```

## Notes

- `create-login-link.sh` generates a time-limited URL for passwordless Virtualmin login — useful for support access
- Proxy scripts integrate with Apache's mod_proxy; ensure mod_proxy is enabled
- GCS and Dropbox require credentials configured in Virtualmin settings
