#!/bin/bash
# Name: virtualmin-disable-limit
# Description: Disable a specific resource limit for a virtual server
# skills.sh: virtualmin, limits, hosting
# Usage: sudo bash disable-limit.sh --domain example.com --limit mailboxes

set -euo pipefail

DOMAIN=""
LIMIT=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --limit)  LIMIT="$2";  shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$LIMIT" ]] && { echo "Usage: $0 --domain <domain> --limit <mailboxes|dbs|aliases|quota>"; exit 1; }

sudo virtualmin disable-limit --domain "$DOMAIN" --"$LIMIT"
echo "Limit '$LIMIT' disabled for $DOMAIN."
