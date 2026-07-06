#!/bin/bash
# Name: virtualmin-disable-feature
# Description: Turn off a feature (web, mail, dns, mysql, ssl, etc.) for a virtual server
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash disable-feature.sh --domain example.com --feature ftp
# Docs:  https://www.virtualmin.com/docs/development/api-programs/disable-feature/

set -euo pipefail

DOMAIN=""
FEATURE=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)  DOMAIN="$2";  shift ;;
    --feature) FEATURE="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$FEATURE" ]] && { echo "Usage: $0 --domain <domain> --feature <web|mail|dns|mysql|ssl|ftp>"; exit 1; }

sudo virtualmin disable-feature --domain "$DOMAIN" --"$FEATURE"
echo "Feature '$FEATURE' disabled for $DOMAIN."
