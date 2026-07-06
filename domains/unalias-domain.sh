#!/bin/bash
# Name: virtualmin-unalias-domain
# Description: Convert an alias domain into a full sub-server
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash unalias-domain.sh --domain alias.com

set -euo pipefail

DOMAIN=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <alias-domain>"; exit 1; }

sudo virtualmin unalias-domain --domain "$DOMAIN"
echo "$DOMAIN converted from alias to sub-server."
