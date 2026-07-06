#!/bin/bash
# Name: virtualmin-list-available-ftp-dirs
# Description: List FTP-accessible directories for a virtual server
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash list-available-ftp-dirs.sh --domain example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-available-ftp-dirs/

set -euo pipefail

DOMAIN=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain>"; exit 1; }

sudo virtualmin list-available-ftp-dirs --domain "$DOMAIN"
