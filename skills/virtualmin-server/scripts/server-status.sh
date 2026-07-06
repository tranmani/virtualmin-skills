#!/bin/bash
# Name: virtualmin-server-status
# Description: Show status of all services managed by Virtualmin (Apache, MySQL, Postfix, etc.)
# Author: tranmani
# skills.sh: virtualmin, server, monitoring, hosting
# Usage: sudo bash server-status.sh [--restart <service>]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/server-status/

set -euo pipefail

RESTART=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --restart) RESTART="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

if [[ -n "$RESTART" ]]; then
  echo "Restarting $RESTART ..."
  sudo virtualmin restart-server --name "$RESTART"
  echo "Done."
else
  echo "=== Virtualmin System Info ==="
  sudo virtualmin info 2>/dev/null | grep -E "Virtualmin|Webmin|OS|Disk|Memory|Domains"
  echo ""
  echo "=== Service Statuses ==="
  sudo virtualmin list-server-statuses 2>/dev/null
fi
