#!/bin/bash
# Name: virtualmin-create-user
# Description: Create a mail, FTP or database user for a Virtualmin domain
# Author: tranmani
# skills.sh: virtualmin, users, hosting
# Usage: sudo bash create-user.sh --domain example.com --user john --pass secret --email john@example.com

set -euo pipefail

DOMAIN=""
USER=""
PASS=""
EMAIL=""
QUOTA=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --user)   USER="$2";   shift ;;
    --pass)   PASS="$2";   shift ;;
    --email)  EMAIL="$2";  shift ;;
    --quota)  QUOTA="$2";  shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$USER" || -z "$PASS" ]] && {
  echo "Usage: $0 --domain <domain> --user <username> --pass <password> [--email <email>] [--quota <MB>]"
  exit 1
}

ARGS=(--domain "$DOMAIN" --user "$USER" --pass "$PASS" --web)
[[ -n "$EMAIL" ]] && ARGS+=(--email "$EMAIL")
[[ -n "$QUOTA" ]] && ARGS+=(--quota "$QUOTA")

sudo virtualmin create-user "${ARGS[@]}"
echo "User $USER created for $DOMAIN."
