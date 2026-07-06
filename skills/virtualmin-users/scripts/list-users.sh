#!/bin/bash
# Name: virtualmin-list-users
# Description: List mail, FTP and database users for a domain or all domains
# skills.sh: virtualmin, users, hosting
# Usage: sudo bash list-users.sh --domain example.com [--name-only] [--email-only]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-users/

set -euo pipefail

DOMAIN=""
ALL=false
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)      DOMAIN="$2"; shift ;;
    --all-domains) ALL=true ;;
    --name-only|--email-only|--multiline|--include-owner) EXTRA_ARGS+=("$1") ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

if $ALL; then
  sudo virtualmin list-users --all-domains "${EXTRA_ARGS[@]}"
elif [[ -n "$DOMAIN" ]]; then
  sudo virtualmin list-users --domain "$DOMAIN" "${EXTRA_ARGS[@]}"
else
  echo "Usage: $0 --domain <domain> | --all-domains [--name-only] [--email-only] [--multiline]"
  exit 1
fi
