#!/bin/bash
# Name: virtualmin-list-available-shells
# Description: List Unix shells available for mail and FTP users
# skills.sh: virtualmin, users, hosting
# Usage: sudo bash list-available-shells.sh --domain example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-available-shells/

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

sudo virtualmin list-available-shells --domain "$DOMAIN"
