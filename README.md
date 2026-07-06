# virtualmin-skills

A complete collection of AI agent skills and shell scripts for managing [Virtualmin](https://www.virtualmin.com/) — the open-source web hosting control panel.

## Install

Install all 14 skills at once (no interactive prompt):

```bash
npx skills add tranmani/virtualmin-skills --yes
```

Or pick specific skills interactively:

```bash
npx skills add tranmani/virtualmin-skills
```

## Skills

| Skill | Description |
|-------|-------------|
| `virtualmin-backup` | Backup and restore virtual servers |
| `virtualmin-domains` | Create, modify, clone and manage domains |
| `virtualmin-users` | Mail/FTP users and aliases |
| `virtualmin-mail` | Mail settings, spam, connectivity tests |
| `virtualmin-databases` | MySQL/PostgreSQL database management |
| `virtualmin-ssl` | SSL certificates and Let's Encrypt |
| `virtualmin-dns` | DNS records and DKIM |
| `virtualmin-php` | PHP versions and php.ini settings |
| `virtualmin-server` | Server status, config, and services |
| `virtualmin-webapps` | WordPress, Drupal, and other web apps |
| `virtualmin-templates` | Server templates and account plans |
| `virtualmin-resellers` | Reseller accounts and resource limits |
| `virtualmin-cloud` | Amazon S3 and Rackspace storage |
| `virtualmin-other` | Proxies, license, logs, plugins, and more |

## Structure

Each skill contains:
- `SKILL.md` — AI agent instructions with command reference
- `scripts/` — Bash scripts for each Virtualmin CLI command

## Requirements

- Virtualmin installed (`/usr/sbin/virtualmin`)
- Run scripts as root or via `sudo`

## Author

tranmani — [github.com/tranmani](https://github.com/tranmani)  
Email: minhhuy8137@gmail.com  
Docs: [virtualmin.com/docs/development/api-programs/](https://www.virtualmin.com/docs/development/api-programs/)
