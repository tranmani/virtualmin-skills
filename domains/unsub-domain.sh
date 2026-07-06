#!/bin/bash
# Name: virtualmin-unsub-domain
# Description: Convert a sub-domain into a top-level sub-server
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash unsub-domain.sh --domain sub.example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/unsub-domain/

set -euo pipefail

DOMAIN=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <sub-domain>"; exit 1; }

sudo virtualmin unsub-domain --domain "$DOMAIN"
echo "$DOMAIN converted from sub-server to top-level server."
