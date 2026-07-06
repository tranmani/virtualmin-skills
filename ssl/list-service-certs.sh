#!/bin/bash
# Name: virtualmin-list-service-certs
# Description: Show which services are using SSL certificates from a virtual server
# skills.sh: virtualmin, ssl, hosting
# Usage: sudo bash list-service-certs.sh --domain example.com

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

sudo virtualmin list-service-certs --domain "$DOMAIN"
