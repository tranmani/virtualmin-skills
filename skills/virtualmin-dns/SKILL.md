---
name: virtualmin-dns
description: Manage DNS records and DKIM signing for Virtualmin domains
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/modify-dns/
---

# Virtualmin DNS

View and modify DNS records for Virtualmin virtual servers, and manage DKIM signing.

## When to Use

- View all DNS records for a domain
- Add, modify, or remove DNS records (A, MX, TXT, CNAME, etc.)
- Enable or disable DKIM email signing

## Available Scripts

| Script | Command | Description |
|--------|---------|-------------|
| `get-dns.sh` | `virtualmin get-dns` | Output all DNS records for a domain |
| `modify-dns.sh` | `virtualmin modify-dns` | Add or modify a DNS record |
| `set-dkim.sh` | `virtualmin set-dkim` | Enable or disable DKIM for all domains |

## Usage

```bash
sudo bash get-dns.sh --domain example.com
sudo bash get-dns.sh --domain example.com --type MX
sudo bash modify-dns.sh --domain example.com --action add --type A --name sub --value 1.2.3.4
sudo bash set-dkim.sh --enable
```

## Notes

- DKIM requires a DNS TXT record; `set-dkim.sh` configures both the key and the DNS record
- DNS changes propagate based on the record's TTL (default 300s)
- Virtualmin manages a local BIND instance; changes are immediate locally
