#!/bin/bash
# Name: virtualmin-modify-reseller
# Description: Modify a reseller account's settings and limits
# skills.sh: virtualmin, resellers, hosting
# Usage: sudo bash modify-reseller.sh --name reseller1 --max-doms 10
# Docs:  https://www.virtualmin.com/docs/development/api-programs/modify-reseller/

set -euo pipefail

NAME=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --name) NAME="$2"; shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$NAME" ]] && { echo "Usage: $0 --name <reseller> [--pass <pass>] [--email <email>] [--max-doms N] [--max-quota N]"; exit 1; }

sudo virtualmin modify-reseller --name "$NAME" "${EXTRA_ARGS[@]}"
echo "Reseller $NAME updated."
