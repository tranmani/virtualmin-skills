#!/bin/bash
# Name: virtualmin-fix-domain-permissions
# Description: Set correct permissions on a domain's home directory
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash fix-domain-permissions.sh --domain example.com

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

sudo virtualmin fix-domain-permissions --domain "$DOMAIN"
echo "Permissions fixed for $DOMAIN."
