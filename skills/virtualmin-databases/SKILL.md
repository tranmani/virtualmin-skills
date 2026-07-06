---
name: virtualmin-databases
description: Create, delete, import and manage MySQL/PostgreSQL databases for Virtualmin domains
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/create-database/
---

# Virtualmin Databases

Manage MySQL/MariaDB and PostgreSQL databases for Virtualmin virtual servers.

## When to Use

- Create or delete databases for a domain
- Import a SQL dump into a domain's database
- Modify database host access or passwords
- List all databases for a domain
- Disconnect a database from a domain

## Available Scripts

| Script | Command | Description |
|--------|---------|-------------|
| `create-database.sh` | `virtualmin create-database` | Create a new database |
| `delete-database.sh` | `virtualmin delete-database` | Delete a database |
| `import-database.sh` | `virtualmin import-database` | Import SQL dump into a database |
| `disconnect-database.sh` | `virtualmin disconnect-database` | Remove database from domain |
| `list-databases.sh` | `virtualmin list-databases` | List databases for a domain |
| `modify-database-hosts.sh` | `virtualmin modify-database-hosts` | Change allowed database hosts |
| `modify-database-pass.sh` | `virtualmin modify-database-pass` | Change database user password |

## Usage

```bash
sudo bash create-database.sh --domain example.com --name mydb --type mysql
sudo bash import-database.sh --domain example.com --name mydb --file dump.sql
sudo bash list-databases.sh --domain example.com
sudo bash delete-database.sh --domain example.com --name mydb
```

## Notes

- Supported types: `mysql` (MySQL/MariaDB), `postgres` (PostgreSQL)
- `import-database.sh` accepts a local SQL file path
- `disconnect-database.sh` removes the domain association but does not drop the database
