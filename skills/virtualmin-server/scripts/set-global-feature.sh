#!/bin/bash
# Name: virtualmin-set-global-feature
# Description: Enable or disable a feature globally for all new virtual servers
# skills.sh: virtualmin, server, hosting
# Usage: sudo bash set-global-feature.sh --feature dns --enable
# Docs:  https://www.virtualmin.com/docs/development/api-programs/set-global-feature/

set -euo pipefail

FEATURE=""
ACTION=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --feature) FEATURE="$2"; shift ;;
    --enable)  ACTION="--enable" ;;
    --disable) ACTION="--disable" ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$FEATURE" || -z "$ACTION" ]] && { echo "Usage: $0 --feature <name> --enable|--disable"; exit 1; }

sudo virtualmin set-global-feature --feature "$FEATURE" "$ACTION"
echo "Feature $FEATURE ${ACTION#--}d globally."
