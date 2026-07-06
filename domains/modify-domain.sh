#!/bin/bash
# Name: virtualmin-modify-domain
# Description: Change parameters of a Virtualmin virtual server
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash modify-domain.sh --domain example.com --quota 5000 --bandwidth 50000
# Docs:  https://www.virtualmin.com/docs/development/api-programs/modify-domain/

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

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain> [--quota MB] [--bandwidth MB] [--pass <password>] [--email <email>]"; exit 1; }

sudo virtualmin modify-domain --domain "$DOMAIN" "${EXTRA_ARGS[@]}"
echo "Domain $DOMAIN updated."
