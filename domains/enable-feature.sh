#!/bin/bash
# Name: virtualmin-enable-feature
# Description: Turn on a feature (web, mail, dns, mysql, ssl, etc.) for a virtual server
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash enable-feature.sh --domain example.com --feature ssl

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

sudo virtualmin enable-feature --domain "$DOMAIN" --"$FEATURE"
echo "Feature '$FEATURE' enabled for $DOMAIN."
