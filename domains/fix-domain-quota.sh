#!/bin/bash
# Name: virtualmin-fix-domain-quota
# Description: Set Unix quotas for a domain to match Virtualmin configuration
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash fix-domain-quota.sh --domain example.com

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

sudo virtualmin fix-domain-quota --domain "$DOMAIN"
echo "Quota fixed for $DOMAIN."
