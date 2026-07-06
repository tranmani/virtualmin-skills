#!/bin/bash
# Name: virtualmin-backup-domain
# Description: Backup one or all Virtualmin virtual servers to a local directory
# Author: tranmani
# skills.sh: virtualmin, backup, hosting
# Usage: sudo bash backup-domain.sh --dest /mnt/data/backups [--domain example.com | --all]

set -euo pipefail

DEST=""
DOMAIN=""
ALL=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --dest)   DEST="$2";   shift ;;
    --domain) DOMAIN="$2"; shift ;;
    --all)    ALL=true ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DEST" ]] && { echo "Usage: $0 --dest <path> [--domain <domain> | --all]"; exit 1; }
mkdir -p "$DEST"

if $ALL; then
  echo "Backing up ALL domains to $DEST ..."
  sudo virtualmin backup-domain --all-domains --all-features --newformat --dest "$DEST/"
elif [[ -n "$DOMAIN" ]]; then
  echo "Backing up $DOMAIN to $DEST ..."
  sudo virtualmin backup-domain --domain "$DOMAIN" --all-features --newformat --dest "$DEST/"
else
  echo "Specify --domain <domain> or --all"
  exit 1
fi

echo "Backup complete. Files in $DEST:"
ls -lh "$DEST/"
