#!/bin/bash
# Name: virtualmin-list-features
# Description: List features (Apache, DNS, mail, etc.) enabled or available in Virtualmin
# skills.sh: virtualmin, server, hosting
# Usage: sudo bash list-features.sh [--enabled-only]

set -euo pipefail

EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --enabled-only) EXTRA_ARGS+=("$1") ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

sudo virtualmin list-features "${EXTRA_ARGS[@]}"
