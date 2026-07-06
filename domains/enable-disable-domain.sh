#!/bin/bash
# Name: virtualmin-toggle-domain
# Description: Enable or disable a Virtualmin virtual server
# Author: tranmani
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash enable-disable-domain.sh --domain example.com --action enable|disable
# Docs:  https://www.virtualmin.com/docs/development/api-programs/enable-disable-domain/

set -euo pipefail

DOMAIN=""
ACTION=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --action) ACTION="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$ACTION" ]] && {
  echo "Usage: $0 --domain <domain> --action enable|disable"
  exit 1
}

case $ACTION in
  enable)  sudo virtualmin enable-domain  --domain "$DOMAIN" && echo "$DOMAIN enabled." ;;
  disable) sudo virtualmin disable-domain --domain "$DOMAIN" && echo "$DOMAIN disabled." ;;
  *) echo "Invalid action: $ACTION (use enable or disable)"; exit 1 ;;
esac
