#!/bin/bash
# Name: virtualmin-create-ip-mapping
# Description: Map an external IP to a virtual server IP for NAT environments
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash create-ip-mapping.sh --ip 1.2.3.4 --internal-ip 10.0.0.5
# Docs:  https://www.virtualmin.com/docs/development/api-programs/create-ip-mapping/

set -euo pipefail

IP=""
INTERNAL=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --ip)          IP="$2";       shift ;;
    --internal-ip) INTERNAL="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$IP" || -z "$INTERNAL" ]] && { echo "Usage: $0 --ip <external-ip> --internal-ip <internal-ip>"; exit 1; }

sudo virtualmin create-ip-mapping --ip "$IP" --internal-ip "$INTERNAL"
echo "IP mapping $IP -> $INTERNAL created."
