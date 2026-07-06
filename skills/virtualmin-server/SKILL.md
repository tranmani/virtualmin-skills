---
name: virtualmin-server
description: Monitor and manage Virtualmin server status, configuration, services and system settings
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/info/
---

# Virtualmin Server

Monitor server health, restart services, validate config, and manage global Virtualmin settings.

## When to Use

- Check if Apache, MySQL, Postfix, Dovecot, BIND are running
- Restart a specific service
- Run a full Virtualmin config check
- View system info (disk, memory, domain count)
- Change a global Virtualmin feature or setting
- Run API commands across multiple servers

## Available Scripts

| Script | Command | Description |
|--------|---------|-------------|
| `server-status.sh` | `virtualmin list-server-statuses` | Show status of all managed services |
| `info.sh` | `virtualmin info` | Show system info (OS, disk, memory, domains) |
| `restart-service.sh` | `virtualmin restart-server` | Restart a specific service |
| `check-config.sh` | `virtualmin check-config` | Run Virtualmin configuration check |
| `validate-domains.sh` | `virtualmin validate-domains` | Validate all domain configurations |
| `list-features.sh` | `virtualmin list-features` | List available Virtualmin features |
| `list-commands.sh` | `virtualmin list-commands` | List all available API commands |
| `set-global-feature.sh` | `virtualmin set-global-feature` | Enable/disable a global feature |
| `modify-all-ips.sh` | `virtualmin modify-all-ips` | Update all domains with a new IP |
| `run-api-command.sh` | `virtualmin run-api-command` | Run an API command across multiple servers |
| `run-all-webalizer.sh` | `virtualmin run-all-webalizer` | Generate Webalizer reports for all domains |
| `check-connectivity.sh` | `virtualmin check-connectivity` | Check network connectivity |
| `config-system.sh` | `virtualmin config-system` | Set Virtualmin system configuration |
| `list-server-statuses.sh` | `virtualmin list-server-statuses` | Detailed server status output |

## Usage

```bash
sudo bash info.sh
sudo bash restart-service.sh --service apache
sudo bash check-config.sh
sudo bash validate-domains.sh --domain example.com
sudo bash modify-all-ips.sh --ip 195.15.201.70
```

## Notes

- Service names for `restart-service.sh`: `apache`, `mysql`, `postfix`, `dovecot`, `bind`, `proftpd`
- Run `check-config.sh` after any major change to catch misconfigurations early
- `modify-all-ips.sh` is used after a server IP change to update all virtual host configs
