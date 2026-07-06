#!/bin/bash
# Name: virtualmin-list-resellers
# Description: List all reseller accounts on this Virtualmin system
# skills.sh: virtualmin, resellers, hosting
# Usage: sudo bash list-resellers.sh [--name-only]

set -euo pipefail

EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --name-only|--multiline) EXTRA_ARGS+=("$1") ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

sudo virtualmin list-resellers "${EXTRA_ARGS[@]}"
