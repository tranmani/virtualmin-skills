---
name: virtualmin-backup
description: Backup and restore Virtualmin virtual servers to local or remote storage
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/backup-domain/
---

# Virtualmin Backup

Manage backups and restores of Virtualmin virtual servers.

## When to Use

- Back up one or all virtual server domains
- Restore a domain from a backup file
- Schedule automated recurring backups
- List, modify, or delete scheduled backup jobs

## Available Scripts

| Script | Command | Description |
|--------|---------|-------------|
| `backup-domain.sh` | `virtualmin backup-domain` | Backup one or all domains |
| `restore-domain.sh` | `virtualmin restore-domain` | Restore a domain from backup file |
| `schedule-backup.sh` | `virtualmin create-scheduled-backup` | Create a scheduled backup job |
| `list-scheduled-backups.sh` | `virtualmin list-scheduled-backups` | List all scheduled backup jobs |
| `modify-scheduled-backup.sh` | `virtualmin modify-scheduled-backup` | Modify a scheduled backup job |
| `list-backup-keys.sh` | `virtualmin list-backup-keys` | List backup encryption keys |
| `delete-backup.sh` | `virtualmin delete-backup` | Delete a logged backup entry |
| `list-backup-logs.sh` | `virtualmin list-backup-logs` | List backup run history |

## Usage

```bash
sudo bash backup-domain.sh --all --dest /mnt/data/backups/virtualmin/
sudo bash restore-domain.sh --file /mnt/data/backups/example.com.tar.gz --domain example.com
sudo bash schedule-backup.sh --dest /mnt/data/backups/ --interval daily --purge 7
```

## Notes

- Store backups on a separate volume (e.g. `/mnt/data`), not the root disk
- Use `--newformat` flag for directory-based (per-domain) backups
- Destinations can be local path, S3, Rackspace, SSH, or Dropbox
- All scripts must be run as root or via `sudo`
