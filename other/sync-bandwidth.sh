#!/bin/bash
# Name: virtualmin-sync-bandwidth
# Description: Manually trigger bandwidth usage collection for all virtual servers
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash sync-bandwidth.sh [--domain example.com]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/sync-bandwidth/

set -euo pipefail

EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) EXTRA_ARGS+=("--domain" "$2"); shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

sudo virtualmin sync-bandwidth "${EXTRA_ARGS[@]}"
echo "Bandwidth sync complete."
