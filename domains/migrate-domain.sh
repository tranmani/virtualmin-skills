#!/bin/bash
# Name: virtualmin-migrate-domain
# Description: Import a virtual server from another control panel (cPanel, Plesk, etc.)
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash migrate-domain.sh --source /path/to/backup.tar.gz --type cpanel --domain example.com

set -euo pipefail

SOURCE=""
TYPE=""
DOMAIN=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --source) SOURCE="$2"; shift ;;
    --type)   TYPE="$2";   shift ;;
    --domain) DOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$SOURCE" || -z "$TYPE" || -z "$DOMAIN" ]] && {
  echo "Usage: $0 --source <file> --type <cpanel|plesk|ensim> --domain <domain>"
  exit 1
}

sudo virtualmin migrate-domain --source "$SOURCE" --type "$TYPE" --domain "$DOMAIN"
echo "Migration complete for $DOMAIN."
