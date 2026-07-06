#!/bin/bash
# Name: virtualmin-modify-limits
# Description: Set resource and feature limits for a virtual server owner
# skills.sh: virtualmin, limits, hosting
# Usage: sudo bash modify-limits.sh --domain example.com --max-mailboxes 20 --max-dbs 5

set -euo pipefail

DOMAIN=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && {
  echo "Usage: $0 --domain <domain> [--max-doms N] [--max-mailboxes N] [--max-dbs N] [--max-aliases N] [--max-quota N] [--allow feature] [--disallow feature] [--shell nologin|ftp|ssh]"
  exit 1
}

sudo virtualmin modify-limits --domain "$DOMAIN" "${EXTRA_ARGS[@]}"
echo "Limits updated for $DOMAIN."
