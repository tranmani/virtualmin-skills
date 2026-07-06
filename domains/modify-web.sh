#!/bin/bash
# Name: virtualmin-modify-web
# Description: Change web server configuration for a virtual server
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash modify-web.sh --domain example.com --php-mode fpm
# Docs:  https://www.virtualmin.com/docs/development/api-programs/modify-web/

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

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain> [--php-mode <mod_php|cgi|fpm>] [--letsencrypt] [--dir <webroot>]"; exit 1; }

sudo virtualmin modify-web --domain "$DOMAIN" "${EXTRA_ARGS[@]}"
echo "Web config updated for $DOMAIN."
