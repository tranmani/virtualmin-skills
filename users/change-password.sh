#!/bin/bash
# Name: virtualmin-change-password
# Description: Change the password of a Virtualmin domain owner or mail user
# skills.sh: virtualmin, users, hosting
# Usage: sudo bash change-password.sh --user john --pass newpassword

set -euo pipefail

USER=""
PASS=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --user) USER="$2"; shift ;;
    --pass) PASS="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$USER" || -z "$PASS" ]] && {
  echo "Usage: $0 --user <username> --pass <newpassword>"
  exit 1
}

sudo virtualmin change-password --user "$USER" --pass "$PASS"
echo "Password updated for $USER."
