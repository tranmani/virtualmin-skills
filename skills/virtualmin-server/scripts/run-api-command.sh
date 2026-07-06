#!/bin/bash
# Name: virtualmin-run-api-command
# Description: Execute a raw Virtualmin API command with arbitrary arguments
# skills.sh: virtualmin, server, hosting
# Usage: sudo bash run-api-command.sh --command list-domains --multiline
# Docs:  https://www.virtualmin.com/docs/development/api-programs/run-api-command/

set -euo pipefail

COMMAND=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --command) COMMAND="$2"; shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$COMMAND" ]] && { echo "Usage: $0 --command <virtualmin-command> [args...]"; exit 1; }

sudo virtualmin "$COMMAND" "${EXTRA_ARGS[@]}"
