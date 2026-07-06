#!/bin/bash
# Name: virtualmin-list-aliases
# Description: List mail aliases for a domain or all domains
# skills.sh: virtualmin, aliases, mail, hosting
# Usage: sudo bash list-aliases.sh --domain example.com [--name-only]

set -euo pipefail

DOMAIN=""
ALL=false
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)      DOMAIN="$2"; shift ;;
    --all-domains) ALL=true ;;
    --name-only|--email-only|--multiline) EXTRA_ARGS+=("$1") ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

if $ALL; then
  sudo virtualmin list-aliases --all-domains "${EXTRA_ARGS[@]}"
elif [[ -n "$DOMAIN" ]]; then
  sudo virtualmin list-aliases --domain "$DOMAIN" "${EXTRA_ARGS[@]}"
else
  echo "Usage: $0 --domain <domain> | --all-domains [--name-only] [--email-only] [--multiline]"
  exit 1
fi
