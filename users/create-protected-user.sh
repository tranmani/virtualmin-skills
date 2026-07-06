#!/bin/bash
# Name: virtualmin-create-protected-user
# Description: Create a user with access to a password-protected directory
# skills.sh: virtualmin, users, hosting
# Usage: sudo bash create-protected-user.sh --domain example.com --user john --pass secret --dir /private

set -euo pipefail

DOMAIN=""
USER=""
PASS=""
DIR=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --user)   USER="$2";   shift ;;
    --pass)   PASS="$2";   shift ;;
    --dir)    DIR="$2";    shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$USER" || -z "$PASS" || -z "$DIR" ]] && {
  echo "Usage: $0 --domain <domain> --user <username> --pass <password> --dir <path>"
  exit 1
}

sudo virtualmin create-protected-user --domain "$DOMAIN" --user "$USER" --pass "$PASS" --dir "$DIR"
echo "Protected user $USER created for $DIR on $DOMAIN."
