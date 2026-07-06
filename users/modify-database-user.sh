#!/bin/bash
# Name: virtualmin-modify-database-user
# Description: Change the MySQL or PostgreSQL login for a domain user
# skills.sh: virtualmin, users, database, hosting
# Usage: sudo bash modify-database-user.sh --domain example.com --user john --pass newpass

set -euo pipefail

DOMAIN=""
USER=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --user)   USER="$2";   shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$USER" ]] && { echo "Usage: $0 --domain <domain> --user <username> [--pass <pass>]"; exit 1; }

sudo virtualmin modify-database-user --domain "$DOMAIN" --user "$USER" "${EXTRA_ARGS[@]}"
echo "Database user $USER updated."
