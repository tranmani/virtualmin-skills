#!/bin/bash
# Name: virtualmin-list-bandwidth
# Description: Show bandwidth usage for domains over a date range
# skills.sh: virtualmin, domains, monitoring, hosting
# Usage: sudo bash list-bandwidth.sh [--domain example.com] [--month 2026-07]

set -euo pipefail

DOMAIN=""
MONTH=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --month)  MONTH="$2";  shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

ARGS=()
[[ -n "$DOMAIN" ]] && ARGS+=(--domain "$DOMAIN") || ARGS+=(--all-domains)
[[ -n "$MONTH" ]]  && ARGS+=(--month "$MONTH")

sudo virtualmin list-bandwidth "${ARGS[@]}"
