#!/bin/bash
# Name: virtualmin-delete-database
# Description: Delete a MySQL or PostgreSQL database from a virtual server
# skills.sh: virtualmin, databases, hosting
# Usage: sudo bash delete-database.sh --domain example.com --name mydb --type mysql

set -euo pipefail

DOMAIN=""
NAME=""
TYPE="mysql"

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --name)   NAME="$2";   shift ;;
    --type)   TYPE="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$NAME" ]] && { echo "Usage: $0 --domain <domain> --name <dbname> [--type mysql|postgres]"; exit 1; }

read -rp "Delete database $NAME ($TYPE) from $DOMAIN? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-database --domain "$DOMAIN" --name "$NAME" --type "$TYPE"
echo "Database $NAME deleted."
