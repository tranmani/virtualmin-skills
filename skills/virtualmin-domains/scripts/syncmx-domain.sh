#!/bin/bash
# Name: virtualmin-syncmx-domain
# Description: Update allowed relay MX addresses for one or more domains
# skills.sh: virtualmin, domains, mail, hosting
# Usage: sudo bash syncmx-domain.sh [--domain example.com | --all-domains]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/syncmx-domain/

set -euo pipefail

DOMAIN=""
ALL=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)      DOMAIN="$2"; shift ;;
    --all-domains) ALL=true ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

if $ALL; then
  sudo virtualmin syncmx-domain --all-domains
elif [[ -n "$DOMAIN" ]]; then
  sudo virtualmin syncmx-domain --domain "$DOMAIN"
else
  echo "Usage: $0 --domain <domain> | --all-domains"
  exit 1
fi
