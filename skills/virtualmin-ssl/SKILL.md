---
name: virtualmin-ssl
description: Generate, install and manage SSL certificates including Let's Encrypt for Virtualmin domains
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/generate-letsencrypt-cert/
---

# Virtualmin SSL

Manage SSL/TLS certificates for Virtualmin virtual servers.

## When to Use

- Issue a Let's Encrypt certificate for a domain
- Generate a self-signed certificate
- Install an existing certificate
- Copy a domain's cert to other services (Postfix, Dovecot, Webmin)
- Check certificate expiry dates across all domains

## Available Scripts

| Script | Command | Description |
|--------|---------|-------------|
| `enable-ssl.sh` | `virtualmin enable-feature --ssl` | Enable SSL for a domain |
| `generate-letsencrypt-cert.sh` | `virtualmin generate-letsencrypt-cert` | Issue Let's Encrypt certificate |
| `generate-cert.sh` | `virtualmin generate-cert` | Generate self-signed certificate |
| `install-cert.sh` | `virtualmin install-cert` | Install an existing certificate |
| `install-service-cert.sh` | `virtualmin install-service-cert` | Copy cert to system service |
| `list-certs.sh` | `virtualmin list-certs` | List certificates for a domain |
| `list-cert-expiry.sh` | `virtualmin list-certs-expiry` | Show expiry dates for all domains |
| `list-service-certs.sh` | `virtualmin list-service-certs` | List certs used by services |

## Usage

```bash
sudo bash generate-letsencrypt-cert.sh --domain example.com --email admin@example.com
sudo bash install-service-cert.sh --domain example.com --service postfix
sudo bash list-cert-expiry.sh
```

## Notes

- Let's Encrypt requires port 80 to be publicly reachable for HTTP-01 challenge
- Use `install-service-cert.sh` after renewing to propagate the cert to Postfix, Dovecot, Webmin, ProFTPD
- `list-cert-expiry.sh` with no args checks all domains — useful for monitoring
