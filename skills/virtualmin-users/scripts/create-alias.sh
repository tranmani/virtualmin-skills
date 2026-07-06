#!/bin/bash
# Name: virtualmin-create-alias
# Description: Create a mail alias (or catch-all with --from "*") for a domain
# skills.sh: virtualmin, aliases, mail, hosting
# Usage: sudo bash create-alias.sh --domain example.com --from sales --to joe@example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/create-alias/

set -euo pipefail

DOMAIN=""
FROM=""
TO=()
DESC=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --from)   FROM="$2";   shift ;;
    --to)     TO+=("--to" "$2"); shift ;;
    --desc)   DESC="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$FROM" || ${#TO[@]} -eq 0 ]] && {
  echo "Usage: $0 --domain <domain> --from <alias|*> --to <dest> [--to <dest2>] [--desc <description>]"
  exit 1
}

ARGS=(--domain "$DOMAIN" --from "$FROM" "${TO[@]}")
[[ -n "$DESC" ]] && ARGS+=(--desc "$DESC")

sudo virtualmin create-alias "${ARGS[@]}"
echo "Alias $FROM@$DOMAIN created."
