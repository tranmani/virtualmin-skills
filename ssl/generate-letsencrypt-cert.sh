#!/bin/bash
# Name: virtualmin-generate-letsencrypt-cert
# Description: Request a Let's Encrypt SSL certificate for a domain
# skills.sh: virtualmin, ssl, letsencrypt, hosting
# Usage: sudo bash generate-letsencrypt-cert.sh --domain example.com [--renew] [--host www.example.com]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/generate-letsencrypt-cert/

set -euo pipefail

DOMAIN=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && {
  echo "Usage: $0 --domain <domain> [--host <alt-hostname>] [--renew] [--web] [--dns] [--rsa] [--ec] [--staging]"
  exit 1
}

sudo virtualmin generate-letsencrypt-cert --domain "$DOMAIN" "${EXTRA_ARGS[@]}"
echo "Let's Encrypt certificate issued for $DOMAIN."
