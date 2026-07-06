#!/bin/bash
# Name: virtualmin-list-php-directories
# Description: List per-directory PHP version overrides for a domain
# skills.sh: virtualmin, php, hosting
# Usage: sudo bash list-php-directories.sh --domain example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-php-directories/

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

sudo virtualmin list-php-directories --domain "$DOMAIN"
