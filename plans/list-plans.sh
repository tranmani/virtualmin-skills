#!/bin/bash
# Name: virtualmin-list-plans
# Description: List all available account plans in Virtualmin
# skills.sh: virtualmin, plans, hosting
# Usage: sudo bash list-plans.sh [--name-only]

set -euo pipefail

EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --name-only|--multiline) EXTRA_ARGS+=("$1") ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

sudo virtualmin list-plans "${EXTRA_ARGS[@]}"
