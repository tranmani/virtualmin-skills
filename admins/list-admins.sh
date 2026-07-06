#!/bin/bash
# Name: virtualmin-list-admins
# Description: List extra administrators for a virtual server
# skills.sh: virtualmin, admins, hosting
# Usage: sudo bash list-admins.sh --domain example.com

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

sudo virtualmin list-admins --domain "$DOMAIN"
