#!/bin/bash
# Name: virtualmin-create-database
# Description: Create a MySQL/MariaDB database for a Virtualmin domain
# Author: tranmani
# skills.sh: virtualmin, database, mysql, hosting
# Usage: sudo bash create-database.sh --domain example.com --name mydb

set -euo pipefail

DOMAIN=""
DBNAME=""
TYPE="mysql"

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --name)   DBNAME="$2"; shift ;;
    --type)   TYPE="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$DBNAME" ]] && {
  echo "Usage: $0 --domain <domain> --name <dbname> [--type mysql|postgres]"
  exit 1
}

sudo virtualmin create-database --domain "$DOMAIN" --name "$DBNAME" --type "$TYPE"
echo "Database $DBNAME ($TYPE) created for $DOMAIN."
