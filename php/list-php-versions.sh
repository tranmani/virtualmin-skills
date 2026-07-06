#!/bin/bash
# Name: virtualmin-list-php-versions
# Description: List PHP versions available on this Virtualmin system
# skills.sh: virtualmin, php, hosting
# Usage: sudo bash list-php-versions.sh [--domain example.com]

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
  sudo virtualmin list-php-versions --domain "$DOMAIN"
else
  sudo virtualmin list-php-versions
fi
