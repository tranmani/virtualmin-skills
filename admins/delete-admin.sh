#!/bin/bash
# Name: virtualmin-delete-admin
# Description: Delete an extra administrator from a virtual server
# skills.sh: virtualmin, admins, hosting
# Usage: sudo bash delete-admin.sh --domain example.com --name admin2
# Docs:  https://www.virtualmin.com/docs/development/api-programs/delete-admin/

set -euo pipefail

DOMAIN=""
NAME=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --name)   NAME="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$NAME" ]] && { echo "Usage: $0 --domain <domain> --name <username>"; exit 1; }

read -rp "Delete admin $NAME from $DOMAIN? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-admin --domain "$DOMAIN" --name "$NAME"
echo "Admin $NAME deleted from $DOMAIN."
