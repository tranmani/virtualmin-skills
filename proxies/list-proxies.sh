#!/bin/bash
# Name: virtualmin-list-proxies
# Description: List proxy paths configured for a virtual server
# skills.sh: virtualmin, proxies, hosting
# Usage: sudo bash list-proxies.sh --domain example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-proxies/

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

sudo virtualmin list-proxies --domain "$DOMAIN"
