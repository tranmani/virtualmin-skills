#!/bin/bash
# Name: virtualmin-enable-limit
# Description: Enable a specific resource limit for a virtual server
# skills.sh: virtualmin, limits, hosting
# Usage: sudo bash enable-limit.sh --domain example.com --limit mailboxes --value 20

set -euo pipefail

DOMAIN=""
LIMIT=""
VALUE=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --limit)  LIMIT="$2";  shift ;;
    --value)  VALUE="$2";  shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$LIMIT" ]] && { echo "Usage: $0 --domain <domain> --limit <mailboxes|dbs|aliases|quota> [--value N]"; exit 1; }

ARGS=(--domain "$DOMAIN" --"$LIMIT")
[[ -n "$VALUE" ]] && ARGS+=("$VALUE")

sudo virtualmin enable-limit "${ARGS[@]}"
echo "Limit '$LIMIT' enabled for $DOMAIN."
