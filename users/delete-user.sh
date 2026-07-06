#!/bin/bash
# Name: virtualmin-delete-user
# Description: Delete a mail, FTP or database user from a Virtualmin domain
# Author: tranmani
# skills.sh: virtualmin, users, hosting
# Usage: sudo bash delete-user.sh --domain example.com --user john
# Docs:  https://www.virtualmin.com/docs/development/api-programs/delete-user/

set -euo pipefail

DOMAIN=""
USER=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --user)   USER="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$USER" ]] && {
  echo "Usage: $0 --domain <domain> --user <username>"
  exit 1
}

read -rp "Delete user $USER from $DOMAIN? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-user --domain "$DOMAIN" --user "$USER"
echo "User $USER deleted from $DOMAIN."
