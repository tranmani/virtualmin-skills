#!/bin/bash
# Name: virtualmin-reset-pass
# Description: Reset a domain owner or user password and send notification email
# skills.sh: virtualmin, users, hosting
# Usage: sudo bash reset-pass.sh --domain example.com [--user john]

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

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain> [--user <username>]"; exit 1; }

ARGS=(--domain "$DOMAIN")
[[ -n "$USER" ]] && ARGS+=(--user "$USER")

sudo virtualmin reset-pass "${ARGS[@]}"
echo "Password reset for ${USER:-domain owner} on $DOMAIN."
