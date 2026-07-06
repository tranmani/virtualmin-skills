#!/bin/bash
# Name: virtualmin-schedule-backup
# Description: Create a scheduled Virtualmin backup job (daily/weekly)
# Author: tranmani
# skills.sh: virtualmin, backup, hosting
# Usage: sudo bash schedule-backup.sh --dest /mnt/data/backups --interval daily|weekly
# Docs:  https://www.virtualmin.com/docs/development/api-programs/schedule-backup/

set -euo pipefail

DEST=""
INTERVAL="daily"
PURGE_DAYS=7

while [[ $# -gt 0 ]]; do
  case $1 in
    --dest)     DEST="$2";     shift ;;
    --interval) INTERVAL="$2"; shift ;;
    --purge)    PURGE_DAYS="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DEST" ]] && { echo "Usage: $0 --dest <path> [--interval daily|weekly] [--purge <days>]"; exit 1; }
mkdir -p "$DEST"

case $INTERVAL in
  daily)   SCHED="0 2 * * *" ;;
  weekly)  SCHED="0 2 * * 0" ;;
  *) echo "Invalid interval: $INTERVAL"; exit 1 ;;
esac

sudo virtualmin create-scheduled-backup \
  --all-domains \
  --all-features \
  --newformat \
  --dest "$DEST/" \
  --purge "$PURGE_DAYS" \
  --sched "$SCHED"

echo "Scheduled $INTERVAL backup created → $DEST (purge after $PURGE_DAYS days)"
sudo virtualmin list-scheduled-backups
