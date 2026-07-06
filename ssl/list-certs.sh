#!/bin/bash
# Name: virtualmin-list-certs
# Description: List SSL certificates for all or specific domains
# skills.sh: virtualmin, ssl, hosting
# Usage: sudo bash list-certs.sh [--domain example.com]

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
  sudo virtualmin list-certs --all-domains
elif [[ -n "$DOMAIN" ]]; then
  sudo virtualmin list-certs --domain "$DOMAIN"
else
  sudo virtualmin list-certs --all-domains
fi
