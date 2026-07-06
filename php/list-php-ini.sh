#!/bin/bash
# Name: virtualmin-list-php-ini
# Description: List PHP ini settings for a domain
# skills.sh: virtualmin, php, hosting
# Usage: sudo bash list-php-ini.sh --domain example.com

set -euo pipefail

DOMAIN=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain>"; exit 1; }

sudo virtualmin list-php-ini --domain "$DOMAIN"
