#!/bin/bash
# Name: virtualmin-delete-proxy
# Description: Remove a proxy path from a virtual server
# skills.sh: virtualmin, proxies, hosting
# Usage: sudo bash delete-proxy.sh --domain example.com --path /app

set -euo pipefail

DOMAIN=""
PATH_ARG=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2";   shift ;;
    --path)   PATH_ARG="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$PATH_ARG" ]] && { echo "Usage: $0 --domain <domain> --path </path>"; exit 1; }

sudo virtualmin delete-proxy --domain "$DOMAIN" --path "$PATH_ARG"
echo "Proxy $PATH_ARG removed from $DOMAIN."
