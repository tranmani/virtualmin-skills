#!/bin/bash
# Name: virtualmin-create-redirect
# Description: Add a web redirect or alias to a domain
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash create-redirect.sh --domain example.com --path /old --dest https://new.example.com

set -euo pipefail

DOMAIN=""
PATH_FROM=""
DEST=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2";    shift ;;
    --path)   PATH_FROM="$2"; shift ;;
    --dest)   DEST="$2";      shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$PATH_FROM" || -z "$DEST" ]] && {
  echo "Usage: $0 --domain <domain> --path </old-path> --dest <destination-url>"
  exit 1
}

sudo virtualmin create-redirect --domain "$DOMAIN" --path "$PATH_FROM" --redirect "$DEST"
echo "Redirect $PATH_FROM → $DEST created for $DOMAIN."
