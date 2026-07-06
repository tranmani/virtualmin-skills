#!/bin/bash
# Name: virtualmin-list-protected-users
# Description: List users with access to password-protected directories
# skills.sh: virtualmin, users, hosting
# Usage: sudo bash list-protected-users.sh --domain example.com --dir /private

set -euo pipefail

DOMAIN=""
DIR=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --dir)    DIR="$2";    shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$DIR" ]] && { echo "Usage: $0 --domain <domain> --dir <path>"; exit 1; }

sudo virtualmin list-protected-users --domain "$DOMAIN" --dir "$DIR"
