#!/bin/bash
# Name: virtualmin-delete-backup
# Description: Delete a previously logged backup record
# skills.sh: virtualmin, backup, hosting
# Usage: sudo bash delete-backup.sh --id <backup-id>

set -euo pipefail

ID=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --id) ID="$2"; shift ;;
    *) echo "Usage: $0 --id <backup-id>"; exit 1 ;;
  esac
  shift
done

[[ -z "$ID" ]] && { echo "Usage: $0 --id <backup-id>"; exit 1; }

read -rp "Delete backup $ID? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-backup --id "$ID"
echo "Backup $ID deleted."
