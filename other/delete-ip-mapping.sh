#!/bin/bash
# Name: virtualmin-delete-ip-mapping
# Description: Remove an external IP to internal IP mapping
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash delete-ip-mapping.sh --ip 1.2.3.4

set -euo pipefail

IP=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --ip) IP="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$IP" ]] && { echo "Usage: $0 --ip <external-ip>"; exit 1; }

read -rp "Delete IP mapping for $IP? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-ip-mapping --ip "$IP"
echo "IP mapping for $IP deleted."
