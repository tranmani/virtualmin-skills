#!/bin/bash
# Name: virtualmin-test-imap
# Description: Test IMAP connectivity and login for a mailbox
# skills.sh: virtualmin, mail, hosting
# Usage: sudo bash test-imap.sh --domain example.com --user user@example.com --pass secret

set -euo pipefail

DOMAIN=""
USER=""
PASS=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --user)   USER="$2";   shift ;;
    --pass)   PASS="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$USER" || -z "$PASS" ]] && {
  echo "Usage: $0 --domain <domain> --user <email> --pass <password>"
  exit 1
}

sudo virtualmin test-imap --domain "$DOMAIN" --user "$USER" --pass "$PASS"
