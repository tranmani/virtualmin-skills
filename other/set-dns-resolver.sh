#!/bin/bash
# Name: virtualmin-set-dns-resolver
# Description: Configure DNS resolver addresses used by the Virtualmin server
# skills.sh: virtualmin, other, dns, hosting
# Usage: sudo bash set-dns-resolver.sh --nameserver 8.8.8.8 --nameserver 8.8.4.4

set -euo pipefail

NAMESERVERS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --nameserver) NAMESERVERS+=("--nameserver" "$2"); shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ ${#NAMESERVERS[@]} -eq 0 ]] && { echo "Usage: $0 --nameserver <ip> [--nameserver <ip>]"; exit 1; }

sudo virtualmin set-dns-resolver "${NAMESERVERS[@]}"
echo "DNS resolver updated."
