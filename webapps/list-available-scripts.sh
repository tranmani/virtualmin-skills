#!/bin/bash
# Name: virtualmin-list-available-scripts
# Description: List all web app scripts available for installation via Virtualmin
# skills.sh: virtualmin, webapps, hosting
# Usage: sudo bash list-available-scripts.sh [--type wordpress]

set -euo pipefail

TYPE=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --type) TYPE="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

if [[ -n "$TYPE" ]]; then
  sudo virtualmin list-available-scripts --type "$TYPE"
else
  sudo virtualmin list-available-scripts
fi
