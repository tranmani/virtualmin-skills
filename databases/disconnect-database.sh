#!/bin/bash
# Name: virtualmin-disconnect-database
# Description: Unlink a database from a virtual server without deleting it
# skills.sh: virtualmin, databases, hosting
# Usage: sudo bash disconnect-database.sh --domain example.com --name mydb --type mysql

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

sudo virtualmin disconnect-database --domain "$DOMAIN" --name "$NAME" --type "$TYPE"
echo "Database $NAME unlinked from $DOMAIN (not deleted)."
