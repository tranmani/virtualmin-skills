#!/bin/bash
# Name: virtualmin-validate-domains
# Description: Check configuration of all virtual servers and report issues
# skills.sh: virtualmin, server, config, hosting
# Usage: sudo bash validate-domains.sh [--domain example.com]

set -euo pipefail

DOMAIN=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

if [[ -n "$DOMAIN" ]]; then
  sudo virtualmin validate-domains --domain "$DOMAIN"
else
  sudo virtualmin validate-domains --all-domains
fi
