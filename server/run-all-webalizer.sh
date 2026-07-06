#!/bin/bash
# Name: virtualmin-run-all-webalizer
# Description: Run Webalizer web stats generation for all virtual servers
# skills.sh: virtualmin, server, hosting
# Usage: sudo bash run-all-webalizer.sh [--domain example.com]

set -euo pipefail

EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) EXTRA_ARGS+=("$1" "$2"); shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

if [[ ${#EXTRA_ARGS[@]} -eq 0 ]]; then
  sudo virtualmin run-all-webalizer
else
  sudo virtualmin run-all-webalizer "${EXTRA_ARGS[@]}"
fi
echo "Webalizer stats generation complete."
