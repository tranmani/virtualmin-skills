#!/bin/bash
# Name: virtualmin-delete-reseller
# Description: Delete a reseller account from Virtualmin
# skills.sh: virtualmin, resellers, hosting
# Usage: sudo bash delete-reseller.sh --name reseller1
# Docs:  https://www.virtualmin.com/docs/development/api-programs/delete-reseller/

set -euo pipefail

NAME=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --name) NAME="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$NAME" ]] && { echo "Usage: $0 --name <reseller>"; exit 1; }

read -rp "Delete reseller $NAME? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-reseller --name "$NAME"
echo "Reseller $NAME deleted."
