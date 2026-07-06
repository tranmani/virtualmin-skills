---
name: virtualmin-users
description: Manage mail, FTP and database users, aliases, mailboxes and protected directories for Virtualmin domains
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/create-user/
---

# Virtualmin Users

Manage mail/FTP users, mail aliases, mailboxes, and protected directories for Virtualmin virtual servers.

## When to Use

- Create or delete mail/FTP users for a domain
- Change user passwords or shell access
- Manage mail aliases and forwarding
- List users, mailboxes, and available shells
- Create protected directory access
- Copy mailboxes between users

## Available Scripts

### Users
| Script | Command | Description |
|--------|---------|-------------|
| `create-user.sh` | `virtualmin create-user` | Create a mail/FTP user |
| `delete-user.sh` | `virtualmin delete-user` | Delete a user |
| `modify-user.sh` | `virtualmin modify-user` | Modify user settings |
| `modify-database-user.sh` | `virtualmin modify-database-user` | Change database user login |
| `list-users.sh` | `virtualmin list-users` | List all users for a domain |
| `change-password.sh` | `virtualmin change-password` | Change a user's password |
| `reset-pass.sh` | `virtualmin reset-pass` | Reset password and email new one |
| `list-available-shells.sh` | `virtualmin list-available-shells` | List valid login shells |
| `list-mailbox.sh` | `virtualmin list-mailbox` | List mailbox contents |
| `copy-mailbox.sh` | `virtualmin copy-mailbox` | Copy mailbox between users |
| `create-protected-user.sh` | `virtualmin create-protected-user` | Create a protected directory user |
| `delete-protected-user.sh` | `virtualmin delete-protected-user` | Delete a protected directory user |
| `list-protected-users.sh` | `virtualmin list-protected-users` | List protected directory users |

### Mail Aliases
| Script | Command | Description |
|--------|---------|-------------|
| `create-alias.sh` | `virtualmin create-alias` | Create a mail alias |
| `create-simple-alias.sh` | `virtualmin create-simple-alias` | Create a simple mail alias |
| `delete-alias.sh` | `virtualmin delete-alias` | Delete a mail alias |
| `list-aliases.sh` | `virtualmin list-aliases` | List all mail aliases |
| `list-simple-aliases.sh` | `virtualmin list-simple-aliases` | List simple aliases |

## Usage

```bash
sudo bash create-user.sh --domain example.com --user john --pass secret --email john@example.com
sudo bash list-users.sh --domain example.com
sudo bash create-alias.sh --domain example.com --from info --to admin@example.com
sudo bash change-password.sh --user john --pass newpassword
```

## Notes

- Users created here get both mail and FTP access by default
- `reset-pass.sh` generates a new password and emails it to the user
- Protected directory users are separate from mail users — they only access HTTP-auth areas
- Aliases can forward to external addresses or local users
