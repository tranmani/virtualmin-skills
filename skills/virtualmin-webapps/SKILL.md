---
name: virtualmin-webapps
description: Install, manage and list web application scripts (WordPress, Drupal, etc.) for Virtualmin domains
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/install-script/
---

# Virtualmin Web Apps

Install and manage web application scripts (WordPress, Joomla, Drupal, etc.) via Virtualmin's script installer.

## When to Use

- Install a web app (WordPress, Drupal, etc.) into a domain
- List installed scripts on a domain
- Remove an installed script
- Browse available scripts on the server
- Start or stop a script-managed service

## Available Scripts

| Script | Command | Description |
|--------|---------|-------------|
| `list-available-scripts.sh` | `virtualmin list-available-scripts` | List all installable web apps |
| `install-script.sh` | `virtualmin install-script` | Install a web app into a domain |
| `list-scripts.sh` | `virtualmin list-scripts` | List installed scripts on a domain |
| `delete-script.sh` | `virtualmin delete-script` | Remove an installed script |
| `start-stop-script.sh` | `virtualmin start-stop-script` | Start or stop a script service |

## Usage

```bash
sudo bash list-available-scripts.sh
sudo bash install-script.sh --domain example.com --script wordpress --version latest --path /
sudo bash list-scripts.sh --domain example.com
sudo bash delete-script.sh --domain example.com --script wordpress
```

## Notes

- Run `list-available-scripts.sh` first to see exact script names and available versions
- Installation path is relative to the domain's public_html directory
- Script installer handles database creation, config writing, and file permissions automatically
