#!/bin/bash
# Name: virtualmin-create-cron-job
# Description: Add a cron job for a virtual server's Unix user
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash create-cron-job.sh --domain example.com --schedule "0 2 * * *" --command "/usr/bin/wp cron event run"
# Docs:  https://www.virtualmin.com/docs/development/api-programs/create-cron-job/

set -euo pipefail

DOMAIN=""
SCHEDULE=""
COMMAND=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)   DOMAIN="$2";   shift ;;
    --schedule) SCHEDULE="$2"; shift ;;
    --command)  COMMAND="$2";  shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$SCHEDULE" || -z "$COMMAND" ]] && {
  echo "Usage: $0 --domain <domain> --schedule '<cron-expr>' --command '<cmd>'"
  exit 1
}

sudo virtualmin create-cron-job --domain "$DOMAIN" --schedule "$SCHEDULE" --command "$COMMAND"
echo "Cron job created for $DOMAIN."
