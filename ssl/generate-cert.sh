#!/bin/bash
# Name: virtualmin-generate-cert
# Description: Generate a self-signed certificate or CSR for a domain
# skills.sh: virtualmin, ssl, hosting
# Usage: sudo bash generate-cert.sh --domain example.com --self --o "My Company" --c US

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
  echo "Usage: $0 --domain <domain> --self|--csr [--size bits] [--days N] [--cn <domain>] [--o <org>] [--c <country>] [--st <state>] [--l <city>] [--email <email>]"
  exit 1
}

sudo virtualmin generate-cert --domain "$DOMAIN" "${EXTRA_ARGS[@]}"
echo "Certificate generated for $DOMAIN."
