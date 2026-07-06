#!/bin/bash
# Name: virtualmin-create-admin
# Description: Create an extra administrator for a virtual server
# skills.sh: virtualmin, admins, hosting
# Usage: sudo bash create-admin.sh --domain example.com --name admin2 --pass secret --email admin2@example.com

set -euo pipefail

DOMAIN=""
NAME=""
PASS=""
EMAIL=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --name)   NAME="$2";   shift ;;
    --pass)   PASS="$2";   shift ;;
    --email)  EMAIL="$2";  shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$NAME" || -z "$PASS" ]] && {
  echo "Usage: $0 --domain <domain> --name <username> --pass <password> [--email <email>] [--create] [--rename] [--edit users|aliases]"
  exit 1
}

ARGS=(--domain "$DOMAIN" --name "$NAME" --pass "$PASS")
[[ -n "$EMAIL" ]] && ARGS+=(--email "$EMAIL")

sudo virtualmin create-admin "${ARGS[@]}" "${EXTRA_ARGS[@]}"
echo "Admin $NAME created for $DOMAIN."
