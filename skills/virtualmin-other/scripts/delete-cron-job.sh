#!/bin/bash
# Name: virtualmin-delete-cron-job
# Description: Remove a cron job from a virtual server's Unix user
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash delete-cron-job.sh --domain example.com --id 3
# Docs:  https://www.virtualmin.com/docs/development/api-programs/delete-cron-job/

set -euo pipefail

DOMAIN=""
ID=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --id)     ID="$2";     shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$ID" ]] && { echo "Usage: $0 --domain <domain> --id <cron-id>"; exit 1; }

read -rp "Delete cron job #$ID for $DOMAIN? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-cron-job --domain "$DOMAIN" --id "$ID"
echo "Cron job deleted."
