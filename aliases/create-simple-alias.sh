#!/bin/bash
# Name: virtualmin-create-simple-alias
# Description: Create a simple mail forwarding alias without full alias features
# skills.sh: virtualmin, aliases, mail, hosting
# Usage: sudo bash create-simple-alias.sh --domain example.com --from info --to admin@example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/create-simple-alias/

set -euo pipefail

DOMAIN=""
FROM=""
TO=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --from)   FROM="$2";   shift ;;
    --to)     TO="$2";     shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$FROM" || -z "$TO" ]] && {
  echo "Usage: $0 --domain <domain> --from <alias> --to <destination>"
  exit 1
}

sudo virtualmin create-simple-alias --domain "$DOMAIN" --from "$FROM" --to "$TO"
echo "Simple alias $FROM@$DOMAIN → $TO created."
