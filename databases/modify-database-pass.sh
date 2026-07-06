#!/bin/bash
# Name: virtualmin-modify-database-pass
# Description: Change the MySQL password for a virtual server's database user
# skills.sh: virtualmin, databases, hosting
# Usage: sudo bash modify-database-pass.sh --domain example.com --pass newpassword

set -euo pipefail

DOMAIN=""
PASS=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --pass)   PASS="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$PASS" ]] && { echo "Usage: $0 --domain <domain> --pass <newpassword>"; exit 1; }

sudo virtualmin modify-database-pass --domain "$DOMAIN" --pass "$PASS"
echo "Database password updated for $DOMAIN."
