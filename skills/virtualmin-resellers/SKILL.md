---
name: virtualmin-resellers
description: Manage Virtualmin reseller accounts, server owner limits, and extra administrators
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/create-reseller/
---

# Virtualmin Resellers & Limits

Manage reseller accounts, resource limits, and extra domain administrators.

## When to Use

- Create or manage reseller accounts that can host multiple domains
- Set or modify resource limits for domain owners
- Add extra administrators to a domain
- Enable or disable specific limits for domain owners

## Available Scripts

| Script | Command | Description |
|--------|---------|-------------|
| `create-reseller.sh` | `virtualmin create-reseller` | Create a new reseller account |
| `delete-reseller.sh` | `virtualmin delete-reseller` | Delete a reseller account |
| `modify-reseller.sh` | `virtualmin modify-reseller` | Modify reseller settings |
| `list-resellers.sh` | `virtualmin list-resellers` | List all reseller accounts |
| `modify-limits.sh` | `virtualmin modify-limits` | Change resource limits for a domain owner |
| `modify-resources.sh` | `virtualmin modify-resources` | Modify resource allocations |
| `enable-limit.sh` | `virtualmin enable-limit` | Enable a resource limit |
| `disable-limit.sh` | `virtualmin disable-limit` | Disable a resource limit |
| `create-admin.sh` | `virtualmin create-admin` | Add an extra domain administrator |
| `delete-admin.sh` | `virtualmin delete-admin` | Remove an extra administrator |
| `modify-admin.sh` | `virtualmin modify-admin` | Modify administrator settings |
| `list-admins.sh` | `virtualmin list-admins` | List extra administrators |

## Usage

```bash
sudo bash create-reseller.sh --name myreseller --pass secret --email reseller@example.com
sudo bash modify-limits.sh --user domainowner --quota 10000 --bandwidth 100000
sudo bash create-admin.sh --domain example.com --user extraadmin --pass secret
sudo bash list-resellers.sh
```

## Notes

- Resellers can create and manage their own virtual servers up to their assigned limits
- Extra admins have Virtualmin access to a specific domain only
- Limits apply to the domain owner's total usage across all their domains
