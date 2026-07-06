#!/bin/bash
# Name: virtualmin-rename-domain
# Description: Change the domain name, home directory or username of a virtual server
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash rename-domain.sh --domain old.com --newdomain new.com

set -euo pipefail

DOMAIN=""
NEWDOMAIN=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)    DOMAIN="$2";    shift ;;
    --newdomain) NEWDOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$NEWDOMAIN" ]] && {
  echo "Usage: $0 --domain <old-domain> --newdomain <new-domain>"
  exit 1
}

sudo virtualmin rename-domain --domain "$DOMAIN" --newdomain "$NEWDOMAIN"
echo "Renamed $DOMAIN → $NEWDOMAIN."
