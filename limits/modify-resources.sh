#!/bin/bash
# Name: virtualmin-modify-resources
# Description: Change server resource allocations (CPU, memory, processes) for a domain
# skills.sh: virtualmin, limits, hosting
# Usage: sudo bash modify-resources.sh --domain example.com --procs 50
# Docs:  https://www.virtualmin.com/docs/development/api-programs/modify-resources/

set -euo pipefail

DOMAIN=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain> [--procs N] [--memory N]"; exit 1; }

sudo virtualmin modify-resources --domain "$DOMAIN" "${EXTRA_ARGS[@]}"
echo "Resources updated for $DOMAIN."
