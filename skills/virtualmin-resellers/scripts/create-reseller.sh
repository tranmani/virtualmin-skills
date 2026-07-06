#!/bin/bash
# Name: virtualmin-create-reseller
# Description: Create a reseller account with optional resource limits and permissions
# skills.sh: virtualmin, resellers, hosting
# Usage: sudo bash create-reseller.sh --name reseller1 --pass secret --email reseller1@example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/create-reseller/

set -euo pipefail

NAME=""
PASS=""
EMAIL=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --name)  NAME="$2";  shift ;;
    --pass)  PASS="$2";  shift ;;
    --email) EMAIL="$2"; shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$NAME" || -z "$PASS" ]] && {
  echo "Usage: $0 --name <login> --pass <password> [--email <email>] [--max-doms N] [--max-quota N] [--desc <text>]"
  exit 1
}

ARGS=(--name "$NAME" --pass "$PASS")
[[ -n "$EMAIL" ]] && ARGS+=(--email "$EMAIL")

sudo virtualmin create-reseller "${ARGS[@]}" "${EXTRA_ARGS[@]}"
echo "Reseller $NAME created."
