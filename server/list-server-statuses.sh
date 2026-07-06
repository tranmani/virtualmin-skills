#!/bin/bash
# Name: virtualmin-list-server-statuses
# Description: List the running status of all system services monitored by Virtualmin
# skills.sh: virtualmin, server, hosting
# Usage: sudo bash list-server-statuses.sh [--name-only]

set -euo pipefail

EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --name-only) EXTRA_ARGS+=("$1") ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

sudo virtualmin list-server-statuses "${EXTRA_ARGS[@]}"
