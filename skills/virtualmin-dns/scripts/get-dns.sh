#!/bin/bash
# Name: virtualmin-get-dns
# Description: Output all DNS records for a Virtualmin domain
# Author: tranmani
# skills.sh: virtualmin, dns, hosting
# Usage: sudo bash get-dns.sh --domain example.com [--type A|MX|TXT|CNAME]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/get-dns/

set -euo pipefail

DOMAIN=""
TYPE=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --type)   TYPE="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain> [--type A|MX|TXT|CNAME]"; exit 1; }

if [[ -n "$TYPE" ]]; then
  sudo virtualmin get-dns --domain "$DOMAIN" | grep -i "^$TYPE "
else
  sudo virtualmin get-dns --domain "$DOMAIN"
fi
