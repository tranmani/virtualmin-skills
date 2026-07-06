---
name: virtualmin-php
description: Manage PHP versions, modes, directories and php.ini settings for Virtualmin domains
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/list-php-versions/
---

# Virtualmin PHP

Configure PHP versions and settings per Virtualmin virtual server.

## When to Use

- List available PHP versions on the server
- Set or change the PHP version for a domain directory
- View or modify php.ini settings per domain
- List PHP-FPM pool directories

## Available Scripts

| Script | Command | Description |
|--------|---------|-------------|
| `list-php-versions.sh` | `virtualmin list-php-versions` | List PHP versions available on server |
| `list-php-directories.sh` | `virtualmin list-php-directories` | List PHP version assignments per directory |
| `set-php-directory.sh` | `virtualmin set-php-directory` | Set PHP version for a directory |
| `delete-php-directory.sh` | `virtualmin delete-php-directory` | Remove PHP version override for a directory |
| `list-php-ini.sh` | `virtualmin list-php-ini` | Show php.ini settings for a domain |
| `modify-php-ini.sh` | `virtualmin modify-php-ini` | Change a php.ini setting for a domain |

## Usage

```bash
sudo bash list-php-versions.sh
sudo bash set-php-directory.sh --domain example.com --dir /home/example.com/public_html --version 8.2
sudo bash modify-php-ini.sh --domain example.com --ini upload_max_filesize --value 64M
sudo bash list-php-ini.sh --domain example.com
```

## Notes

- Multiple PHP versions can coexist on the same server using PHP-FPM
- `modify-php-ini.sh` changes the domain-level php.ini, not the global one
- Use `list-php-versions.sh` first to get exact version strings for `set-php-directory.sh`
