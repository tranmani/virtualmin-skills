#!/bin/bash
# Name: virtualmin-resend-email
# Description: Re-send the signup email for a virtual server
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash resend-email.sh --domain example.com

set -euo pipefail

DOMAIN=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain>"; exit 1; }

sudo virtualmin resend-email --domain "$DOMAIN"
echo "Signup email resent for $DOMAIN."
