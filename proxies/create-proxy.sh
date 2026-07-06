#!/bin/bash
# Name: virtualmin-create-proxy
# Description: Add a proxy or load-balancer path to a virtual server
# skills.sh: virtualmin, proxies, hosting
# Usage: sudo bash create-proxy.sh --domain example.com --path /app --url http://127.0.0.1:8080

set -euo pipefail

DOMAIN=""
PATH_ARG=""
URL=()
BALANCER=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)   DOMAIN="$2";   shift ;;
    --path)     PATH_ARG="$2"; shift ;;
    --url)      URL+=("--url" "$2"); shift ;;
    --balancer) BALANCER="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$PATH_ARG" || ${#URL[@]} -eq 0 ]] && {
  echo "Usage: $0 --domain <domain> --path </path> --url <dest-url> [--url <url2>] [--balancer <name>]"
  exit 1
}

ARGS=(--domain "$DOMAIN" --path "$PATH_ARG" "${URL[@]}")
[[ -n "$BALANCER" ]] && ARGS+=(--balancer "$BALANCER")

sudo virtualmin create-proxy "${ARGS[@]}"
echo "Proxy $PATH_ARG → created on $DOMAIN."
