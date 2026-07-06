#!/bin/bash
# Name: virtualmin-send-email
# Description: Send an email message to a virtual server owner via Virtualmin
# skills.sh: virtualmin, other, mail, hosting
# Usage: sudo bash send-email.sh --domain example.com --subject "Notice" --msg "Your account..."
# Docs:  https://www.virtualmin.com/docs/development/api-programs/send-email/

set -euo pipefail

DOMAIN=""
SUBJECT=""
MSG=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)  DOMAIN="$2";  shift ;;
    --subject) SUBJECT="$2"; shift ;;
    --msg)     MSG="$2";     shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$SUBJECT" || -z "$MSG" ]] && {
  echo "Usage: $0 --domain <domain> --subject <subject> --msg <message>"
  exit 1
}

sudo virtualmin send-email --domain "$DOMAIN" --subject "$SUBJECT" --msg "$MSG"
echo "Email sent to owner of $DOMAIN."
