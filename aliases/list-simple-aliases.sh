#!/bin/bash
# Name: virtualmin-list-simple-aliases
# Description: List simple mail forwarding aliases for a domain
# skills.sh: virtualmin, aliases, mail, hosting
# Usage: sudo bash list-simple-aliases.sh --domain example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-simple-aliases/

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

sudo virtualmin list-simple-aliases --domain "$DOMAIN"
