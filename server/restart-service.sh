#!/bin/bash
# Name: virtualmin-restart-service
# Description: Restart a service managed by Virtualmin (apache, mysql, postfix, dovecot, bind, proftpd)
# skills.sh: virtualmin, server, hosting
# Usage: sudo bash restart-service.sh --service apache

set -euo pipefail

SERVICE=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --service) SERVICE="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$SERVICE" ]] && {
  echo "Usage: $0 --service <apache|mysql|postfix|dovecot|bind|proftpd>"
  echo ""
  echo "Available services:"
  sudo virtualmin list-server-statuses | awk '{print "  "$1}'
  exit 1
}

sudo virtualmin restart-server --name "$SERVICE"
echo "$SERVICE restarted."
