#!/bin/bash
# Name: virtualmin-modify-admin
# Description: Modify an extra administrator's settings for a virtual server
# skills.sh: virtualmin, admins, hosting
# Usage: sudo bash modify-admin.sh --domain example.com --name admin2 --pass newpass

set -euo pipefail

DOMAIN=""
NAME=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --name)   NAME="$2";   shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$NAME" ]] && { echo "Usage: $0 --domain <domain> --name <username> [--pass <pass>] [--email <email>] [--edit users|aliases]"; exit 1; }

sudo virtualmin modify-admin --domain "$DOMAIN" --name "$NAME" "${EXTRA_ARGS[@]}"
echo "Admin $NAME updated."
