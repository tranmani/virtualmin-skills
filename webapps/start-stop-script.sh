#!/bin/bash
# Name: virtualmin-start-stop-script
# Description: Start or stop a web app script's background process (e.g. Ruby, Node)
# skills.sh: virtualmin, webapps, hosting
# Usage: sudo bash start-stop-script.sh --domain example.com --type rails --action start|stop

set -euo pipefail

DOMAIN=""
TYPE=""
ACTION=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --type)   TYPE="$2";   shift ;;
    --action) ACTION="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$TYPE" || -z "$ACTION" ]] && {
  echo "Usage: $0 --domain <domain> --type <app> --action start|stop"
  exit 1
}

sudo virtualmin start-stop-script --domain "$DOMAIN" --type "$TYPE" --"$ACTION"
echo "$TYPE ${ACTION}ed on $DOMAIN."
