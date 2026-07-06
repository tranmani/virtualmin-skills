#!/bin/bash
# Name: virtualmin-delete-plan
# Description: Remove an existing account plan from Virtualmin
# skills.sh: virtualmin, plans, hosting
# Usage: sudo bash delete-plan.sh --name "Basic Plan"
# Docs:  https://www.virtualmin.com/docs/development/api-programs/delete-plan/

set -euo pipefail

NAME=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --name) NAME="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$NAME" ]] && { echo "Usage: $0 --name <plan>"; exit 1; }

read -rp "Delete plan '$NAME'? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-plan --name "$NAME"
echo "Plan '$NAME' deleted."
