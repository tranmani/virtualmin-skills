#!/bin/bash
# Name: virtualmin-modify-user
# Description: Modify a mail, FTP or database user for a Virtualmin domain
# skills.sh: virtualmin, users, hosting
# Usage: sudo bash modify-user.sh --domain example.com --user john [--pass newpass] [--quota 500] [--disable]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/modify-user/

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

[[ -z "$DOMAIN" || -z "$USER" ]] && {
  echo "Usage: $0 --domain <domain> --user <username> [--pass <pass>] [--quota <MB>] [--real <name>] [--disable] [--enable] [--enable-ftp] [--disable-ftp] [--add-email <addr>] [--remove-email <addr>]"
  exit 1
}

sudo virtualmin modify-user --domain "$DOMAIN" --user "$USER" "${EXTRA_ARGS[@]}"
echo "User $USER updated."
