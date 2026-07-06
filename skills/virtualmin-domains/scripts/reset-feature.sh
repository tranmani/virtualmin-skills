#!/bin/bash
# Name: virtualmin-reset-feature
# Description: Reset a virtual server feature back to its default configuration
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash reset-feature.sh --domain example.com --feature web
# Docs:  https://www.virtualmin.com/docs/development/api-programs/reset-feature/

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

[[ -z "$DOMAIN" || -z "$FEATURE" ]] && { echo "Usage: $0 --domain <domain> --feature <web|mail|dns|mysql|ssl>"; exit 1; }

sudo virtualmin reset-feature --domain "$DOMAIN" --"$FEATURE"
echo "Feature '$FEATURE' reset for $DOMAIN."
