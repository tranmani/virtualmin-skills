#!/bin/bash
# Name: virtualmin-list-commands
# Description: List all virtualmin CLI API commands available on this server
# skills.sh: virtualmin, server, hosting
# Usage: sudo bash list-commands.sh [--name-only]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-commands/

set -euo pipefail

EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --name-only) EXTRA_ARGS+=("$1") ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

sudo virtualmin list-commands "${EXTRA_ARGS[@]}"
