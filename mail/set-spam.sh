#!/bin/bash
# Name: virtualmin-set-spam
# Description: Configure SpamAssassin spam filtering settings for a domain
# skills.sh: virtualmin, mail, hosting
# Usage: sudo bash set-spam.sh --domain example.com --enable --level 5

set -euo pipefail

DOMAIN=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain> --enable|--disable [--level N] [--action delete|bounce|tag]"; exit 1; }

sudo virtualmin set-spam --domain "$DOMAIN" "${EXTRA_ARGS[@]}"
echo "Spam settings updated for $DOMAIN."
