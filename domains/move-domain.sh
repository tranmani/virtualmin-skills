#!/bin/bash
# Name: virtualmin-move-domain
# Description: Change the owner (reseller) of a virtual server
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash move-domain.sh --domain example.com --newuser newowner
# Docs:  https://www.virtualmin.com/docs/development/api-programs/move-domain/

set -euo pipefail

DOMAIN=""
NEWUSER=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)  DOMAIN="$2";  shift ;;
    --newuser) NEWUSER="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$NEWUSER" ]] && { echo "Usage: $0 --domain <domain> --newuser <username>"; exit 1; }

sudo virtualmin move-domain --domain "$DOMAIN" --newuser "$NEWUSER"
echo "$DOMAIN moved to $NEWUSER."
