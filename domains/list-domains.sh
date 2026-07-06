#!/bin/bash
# Name: virtualmin-list-domains
# Description: List all Virtualmin virtual servers with key info
# Author: tranmani
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash list-domains.sh [--name-only] [--user USER]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-domains/

set -euo pipefail

NAME_ONLY=false
USER_FILTER=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --name-only) NAME_ONLY=true ;;
    --user) USER_FILTER="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

if $NAME_ONLY; then
  sudo virtualmin list-domains --name-only
elif [[ -n "$USER_FILTER" ]]; then
  sudo virtualmin list-domains --user "$USER_FILTER"
else
  sudo virtualmin list-domains --multiline | grep -E "^[^ ]|Server name|Username|Home directory|Disk space"
fi
