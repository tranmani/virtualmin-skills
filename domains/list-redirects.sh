#!/bin/bash
# Name: virtualmin-list-redirects
# Description: List web redirects and aliases configured for a domain
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash list-redirects.sh --domain example.com

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

sudo virtualmin list-redirects --domain "$DOMAIN"
