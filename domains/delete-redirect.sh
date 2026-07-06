#!/bin/bash
# Name: virtualmin-delete-redirect
# Description: Remove a web redirect or alias from a domain
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash delete-redirect.sh --domain example.com --path /old
# Docs:  https://www.virtualmin.com/docs/development/api-programs/delete-redirect/

set -euo pipefail

DOMAIN=""
PATH_FROM=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2";    shift ;;
    --path)   PATH_FROM="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$PATH_FROM" ]] && { echo "Usage: $0 --domain <domain> --path </path>"; exit 1; }

sudo virtualmin delete-redirect --domain "$DOMAIN" --path "$PATH_FROM"
echo "Redirect $PATH_FROM removed from $DOMAIN."
