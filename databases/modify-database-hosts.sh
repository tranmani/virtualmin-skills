#!/bin/bash
# Name: virtualmin-modify-database-hosts
# Description: Change which hosts are allowed to connect to a domain's MySQL databases
# skills.sh: virtualmin, databases, hosting
# Usage: sudo bash modify-database-hosts.sh --domain example.com --host 192.168.1.%

set -euo pipefail

DOMAIN=""
HOST=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --host)   HOST="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$HOST" ]] && { echo "Usage: $0 --domain <domain> --host <hostname|ip|%>"; exit 1; }

sudo virtualmin modify-database-hosts --domain "$DOMAIN" --host "$HOST"
echo "Database host access updated for $DOMAIN."
