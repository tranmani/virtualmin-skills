#!/bin/bash
# Name: virtualmin-test-smtp
# Description: Test SMTP delivery for a virtual server's mail configuration
# skills.sh: virtualmin, mail, hosting
# Usage: sudo bash test-smtp.sh --domain example.com --user user@example.com

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

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain> [--user <email>]"; exit 1; }

ARGS=(--domain "$DOMAIN")
[[ -n "$USER" ]] && ARGS+=(--user "$USER")

sudo virtualmin test-smtp "${ARGS[@]}"
