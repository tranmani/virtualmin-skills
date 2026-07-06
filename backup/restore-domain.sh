#!/bin/bash
# Name: virtualmin-restore-domain
# Description: Restore a Virtualmin virtual server from a backup file
# Author: tranmani
# skills.sh: virtualmin, backup, hosting
# Usage: sudo bash restore-domain.sh --file /mnt/data/backups/example.com.tar.gz --domain example.com

set -euo pipefail

FILE=""
DOMAIN=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --file)   FILE="$2";   shift ;;
    --domain) DOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$FILE" || -z "$DOMAIN" ]] && {
  echo "Usage: $0 --file <backup.tar.gz> --domain <domain>"
  exit 1
}

[[ ! -f "$FILE" ]] && { echo "Backup file not found: $FILE"; exit 1; }

echo "Restoring $DOMAIN from $FILE ..."
sudo virtualmin restore-domain \
  --domain "$DOMAIN" \
  --all-features \
  --source "$FILE"

echo "Restore complete for $DOMAIN."
