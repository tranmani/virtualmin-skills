---
name: virtualmin-templates
description: Manage Virtualmin server templates and account plans for standardised domain provisioning
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/create-template/
---

# Virtualmin Templates & Plans

Manage server templates and account plans to standardise how new virtual servers are created.

## When to Use

- Create reusable templates for new domain provisioning
- Define account plans with resource limits (disk, bandwidth, users)
- Modify or delete existing templates and plans
- Apply consistent settings across new domains

## Available Scripts

| Script | Command | Description |
|--------|---------|-------------|
| `create-template.sh` | `virtualmin create-template` | Create a new server template |
| `delete-template.sh` | `virtualmin delete-template` | Delete a template |
| `get-template.sh` | `virtualmin get-template` | Show all settings in a template |
| `modify-template.sh` | `virtualmin modify-template` | Change template settings |
| `list-templates.sh` | `virtualmin list-templates` | List all available templates |
| `create-plan.sh` | `virtualmin create-plan` | Create a new account plan |
| `delete-plan.sh` | `virtualmin delete-plan` | Delete an account plan |
| `modify-plan.sh` | `virtualmin modify-plan` | Modify an account plan |
| `list-plans.sh` | `virtualmin list-plans` | List all account plans |

## Usage

```bash
sudo bash list-templates.sh
sudo bash create-plan.sh --name "Basic" --quota 5000 --bandwidth 50000 --mailboxes 10
sudo bash list-plans.sh
sudo bash create-domain.sh --domain example.com --plan "Basic"
```

## Notes

- Templates control server-level settings (Apache config, DNS zones, mail settings)
- Plans control resource limits (quota, bandwidth, max databases, max users)
- Assign a plan when creating a domain with `virtualmin create-domain --plan <name>`
