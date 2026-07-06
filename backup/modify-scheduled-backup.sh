#!/bin/bash
# Name: virtualmin-modify-scheduled-backup
# Description: Change attributes of an existing scheduled backup job
# skills.sh: virtualmin, backup, hosting
# Usage: sudo bash modify-scheduled-backup.sh --id <id> --dest <path> [--sched "0 2 * * *"]

set -euo pipefail

ID=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --id) ID="$2"; shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$ID" ]] && { echo "Usage: $0 --id <id> [--dest <path>] [--sched <cron>] [--purge <days>]"; exit 1; }

sudo virtualmin modify-scheduled-backup --id "$ID" "${EXTRA_ARGS[@]}"
echo "Scheduled backup $ID updated."
