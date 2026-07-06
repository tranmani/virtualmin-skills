# virtualmin-skills

A collection of shell skills for managing [Virtualmin](https://www.virtualmin.com/) — the open-source web hosting control panel built on Webmin.

Each skill is a self-contained bash script covering a specific Virtualmin CLI category. Designed to be uploaded to [skills.sh](https://skills.sh).

## Categories

| Folder | Description |
|---|---|
| `domains/` | Create, list, modify, delete virtual servers |
| `backup/` | Backup and restore domains |
| `users/` | Mail, FTP, and database user management |
| `ssl/` | SSL certificate management and Let's Encrypt |
| `dns/` | DNS record management |
| `mail/` | Mail aliases, forwarding, spam settings |
| `databases/` | MySQL/PostgreSQL database management |
| `server/` | Server status, config checks, restarts |

## Requirements

- Virtualmin installed (`/usr/sbin/virtualmin`)
- Must run as root or via `sudo`

## Usage

Each script can be run directly or sourced as a reference:
```bash
sudo bash domains/list-domains.sh
```

## Author

tranmani — [github.com/tranmani](https://github.com/tranmani)
