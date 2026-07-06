#!/bin/bash
# Name: virtualmin-notify-domains
# Description: Send signup/notification email to virtual server owners
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash notify-domains.sh [--domain example.com | --all-domains]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/notify-domains/

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
  sudo virtualmin notify-domains --all-domains
elif [[ -n "$DOMAIN" ]]; then
  sudo virtualmin notify-domains --domain "$DOMAIN"
else
  echo "Usage: $0 --domain <domain> | --all-domains"
  exit 1
fi
