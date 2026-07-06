#!/bin/bash
# Name: virtualmin-config-system
# Description: Run Virtualmin's system configuration check and auto-fix wizard
# skills.sh: virtualmin, server, hosting
# Usage: sudo bash config-system.sh [--fix]

set -euo pipefail

FIX=false
while [[ $# -gt 0 ]]; do
  case $1 in
    --fix) FIX=true ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

if $FIX; then
  sudo virtualmin config-system --fix
else
  sudo virtualmin config-system
fi
