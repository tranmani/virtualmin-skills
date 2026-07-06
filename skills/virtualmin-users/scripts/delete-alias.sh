#!/bin/bash
# Name: virtualmin-delete-alias
# Description: Delete a mail alias from a domain (use "*" for catch-all)
# skills.sh: virtualmin, aliases, mail, hosting
# Usage: sudo bash delete-alias.sh --domain example.com --from sales
# Docs:  https://www.virtualmin.com/docs/development/api-programs/delete-alias/

set -euo pipefail

DOMAIN=""
FROM=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --from)   FROM="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$FROM" ]] && { echo "Usage: $0 --domain <domain> --from <alias|*>"; exit 1; }

sudo virtualmin delete-alias --domain "$DOMAIN" --from "$FROM"
echo "Alias $FROM@$DOMAIN deleted."
