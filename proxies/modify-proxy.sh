#!/bin/bash
# Name: virtualmin-modify-proxy
# Description: Update a proxy path configuration on a virtual server
# skills.sh: virtualmin, proxies, hosting
# Usage: sudo bash modify-proxy.sh --domain example.com --path /app --url http://127.0.0.1:9000
# Docs:  https://www.virtualmin.com/docs/development/api-programs/modify-proxy/

set -euo pipefail

DOMAIN=""
PATH_ARG=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2";   shift ;;
    --path)   PATH_ARG="$2"; shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$PATH_ARG" ]] && { echo "Usage: $0 --domain <domain> --path </path> --url <new-dest>"; exit 1; }

sudo virtualmin modify-proxy --domain "$DOMAIN" --path "$PATH_ARG" "${EXTRA_ARGS[@]}"
echo "Proxy $PATH_ARG updated on $DOMAIN."
