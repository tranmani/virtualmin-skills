#!/bin/bash
# Name: virtualmin-list-databases
# Description: List all databases for a Virtualmin domain
# skills.sh: virtualmin, database, hosting
# Usage: sudo bash list-databases.sh --domain example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-databases/

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

sudo virtualmin list-databases --domain "$DOMAIN"
