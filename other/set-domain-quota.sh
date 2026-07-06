#!/bin/bash
# Name: virtualmin-set-domain-quota
# Description: Set the disk quota for a virtual server
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash set-domain-quota.sh --domain example.com --quota 5000
# Docs:  https://www.virtualmin.com/docs/development/api-programs/set-domain-quota/

set -euo pipefail

DOMAIN=""
QUOTA=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --quota)  QUOTA="$2";  shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$QUOTA" ]] && { echo "Usage: $0 --domain <domain> --quota <MB>"; exit 1; }

sudo virtualmin set-domain-quota --domain "$DOMAIN" --quota "$QUOTA"
echo "Quota for $DOMAIN set to ${QUOTA}MB."
