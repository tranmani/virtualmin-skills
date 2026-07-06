#!/bin/bash
# Name: virtualmin-cert-expiry
# Description: List SSL certificate expiry dates for all or specific domains
# Author: tranmani
# skills.sh: virtualmin, ssl, hosting
# Usage: sudo bash list-cert-expiry.sh [--domain example.com]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-cert-expiry/

set -euo pipefail

DOMAIN=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

if [[ -n "$DOMAIN" ]]; then
  sudo virtualmin list-certs-expiry --domain "$DOMAIN"
else
  echo "Checking SSL expiry for all domains..."
  sudo virtualmin list-certs-expiry --all-domains | grep -E "domain|expiry|days" | awk '
    /domain/ { domain=$NF }
    /expiry/ { expiry=$NF }
    /days/   { days=$NF; printf "%-40s %s (%s days)\n", domain, expiry, days }
  '
fi
