#!/bin/bash
# Name: virtualmin-list-scripts
# Description: List web app scripts installed on a domain
# skills.sh: virtualmin, webapps, hosting
# Usage: sudo bash list-scripts.sh --domain example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-scripts/

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
  sudo virtualmin list-scripts --all-domains
elif [[ -n "$DOMAIN" ]]; then
  sudo virtualmin list-scripts --domain "$DOMAIN"
else
  echo "Usage: $0 --domain <domain> | --all-domains"
  exit 1
fi
