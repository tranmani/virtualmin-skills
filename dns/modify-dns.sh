#!/bin/bash
# Name: virtualmin-modify-dns
# Description: Add or modify a DNS record for a Virtualmin domain
# Author: tranmani
# skills.sh: virtualmin, dns, hosting
# Usage: sudo bash modify-dns.sh --domain example.com --action add --type A --name sub --value 1.2.3.4

set -euo pipefail

DOMAIN=""
ACTION="add"
TYPE=""
NAME=""
VALUE=""
TTL="300"

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --action) ACTION="$2"; shift ;;
    --type)   TYPE="$2";   shift ;;
    --name)   NAME="$2";   shift ;;
    --value)  VALUE="$2";  shift ;;
    --ttl)    TTL="$2";    shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$TYPE" || -z "$NAME" || -z "$VALUE" ]] && {
  echo "Usage: $0 --domain <domain> --type <A|MX|TXT|CNAME> --name <host> --value <val> [--ttl <seconds>]"
  exit 1
}

sudo virtualmin modify-dns \
  --domain "$DOMAIN" \
  --"$ACTION"-record "$TYPE" \
  --name "$NAME" \
  --value "$VALUE" \
  --ttl "$TTL"

echo "DNS $TYPE record ${ACTION}ed for $DOMAIN."
