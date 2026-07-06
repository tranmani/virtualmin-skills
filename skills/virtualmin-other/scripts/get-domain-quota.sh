#!/bin/bash
# Name: virtualmin-get-domain-quota
# Description: Show disk quota usage for a specific virtual server
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash get-domain-quota.sh --domain example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/get-domain-quota/

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

sudo virtualmin get-domain-quota --domain "$DOMAIN"
