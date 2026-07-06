#!/bin/bash
# Name: virtualmin-modify-all-ips
# Description: Update the IP address for all virtual servers (useful after server IP change)
# skills.sh: virtualmin, server, hosting
# Usage: sudo bash modify-all-ips.sh --ip 1.2.3.4 --old-ip 9.8.7.6

set -euo pipefail

IP=""
OLD_IP=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --ip)     IP="$2";     shift ;;
    --old-ip) OLD_IP="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$IP" ]] && { echo "Usage: $0 --ip <new-ip> [--old-ip <old-ip>]"; exit 1; }

ARGS=(--ip "$IP")
[[ -n "$OLD_IP" ]] && ARGS+=(--old-ip "$OLD_IP")

sudo virtualmin modify-all-ips "${ARGS[@]}"
echo "All virtual server IPs updated to $IP."
