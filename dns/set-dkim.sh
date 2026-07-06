#!/bin/bash
# Name: virtualmin-set-dkim
# Description: Enable, disable, or configure DKIM signing for a domain
# skills.sh: virtualmin, dns, mail, hosting
# Usage: sudo bash set-dkim.sh --domain example.com --enable
# Docs:  https://www.virtualmin.com/docs/development/api-programs/set-dkim/

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

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain> --enable|--disable [--key-size bits]"; exit 1; }

sudo virtualmin set-dkim --domain "$DOMAIN" "${EXTRA_ARGS[@]}"
echo "DKIM settings updated for $DOMAIN."
