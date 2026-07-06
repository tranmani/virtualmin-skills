#!/bin/bash
# Name: virtualmin-delete-protected-user
# Description: Remove a user from a password-protected directory
# skills.sh: virtualmin, users, hosting
# Usage: sudo bash delete-protected-user.sh --domain example.com --user john --dir /private

set -euo pipefail

DOMAIN=""
USER=""
DIR=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --user)   USER="$2";   shift ;;
    --dir)    DIR="$2";    shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$USER" || -z "$DIR" ]] && {
  echo "Usage: $0 --domain <domain> --user <username> --dir <path>"
  exit 1
}

sudo virtualmin delete-protected-user --domain "$DOMAIN" --user "$USER" --dir "$DIR"
echo "Protected user $USER removed from $DIR."
