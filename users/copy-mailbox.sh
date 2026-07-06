#!/bin/bash
# Name: virtualmin-copy-mailbox
# Description: Copy emails from one mailbox to another
# skills.sh: virtualmin, users, mail, hosting
# Usage: sudo bash copy-mailbox.sh --domain example.com --user john --dest-domain example.com --dest-user jane

set -euo pipefail

DOMAIN=""
USER=""
DEST_DOMAIN=""
DEST_USER=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)      DOMAIN="$2";      shift ;;
    --user)        USER="$2";        shift ;;
    --dest-domain) DEST_DOMAIN="$2"; shift ;;
    --dest-user)   DEST_USER="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$USER" || -z "$DEST_DOMAIN" || -z "$DEST_USER" ]] && {
  echo "Usage: $0 --domain <domain> --user <user> --dest-domain <domain> --dest-user <user>"
  exit 1
}

sudo virtualmin copy-mailbox --domain "$DOMAIN" --user "$USER" --dest-domain "$DEST_DOMAIN" --dest-user "$DEST_USER"
echo "Mailbox copied from $USER@$DOMAIN to $DEST_USER@$DEST_DOMAIN."
