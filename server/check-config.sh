#!/bin/bash
# Name: virtualmin-check-config
# Description: Run Virtualmin configuration check and validate all domains
# Author: tranmani
# skills.sh: virtualmin, server, config, hosting
# Usage: sudo bash check-config.sh [--fix]

set -euo pipefail

FIX=false
while [[ $# -gt 0 ]]; do
  case $1 in
    --fix) FIX=true ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

echo "=== Virtualmin Config Check ==="
sudo virtualmin check-config

echo ""
echo "=== Domain Validation ==="
if $FIX; then
  sudo virtualmin validate-domains --all-domains --fix
else
  sudo virtualmin validate-domains --all-domains
fi
