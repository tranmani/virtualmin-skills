#!/bin/bash
# Name: virtualmin-list-mailbox
# Description: List emails in a user's mailbox
# skills.sh: virtualmin, users, mail, hosting
# Usage: sudo bash list-mailbox.sh --domain example.com --user john
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-mailbox/

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

[[ -z "$DOMAIN" || -z "$USER" ]] && { echo "Usage: $0 --domain <domain> --user <username>"; exit 1; }

sudo virtualmin list-mailbox --domain "$DOMAIN" --user "$USER"
