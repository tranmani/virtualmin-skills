#!/bin/bash
# Name: virtualmin-update-license
# Description: Update the Virtualmin license key from the license server
# skills.sh: virtualmin, license, hosting
# Usage: sudo bash update-license.sh [--serial XXXXX] [--key XXXXX]

set -euo pipefail

EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --serial|--key) EXTRA_ARGS+=("$1" "$2"); shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

sudo virtualmin update-license "${EXTRA_ARGS[@]}"
echo "License updated."
