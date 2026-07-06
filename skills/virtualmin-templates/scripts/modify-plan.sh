#!/bin/bash
# Name: virtualmin-modify-plan
# Description: Modify an existing account plan's resource limits
# skills.sh: virtualmin, plans, hosting
# Usage: sudo bash modify-plan.sh --name "Basic Plan" --max-mailboxes 20
# Docs:  https://www.virtualmin.com/docs/development/api-programs/modify-plan/

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

[[ -z "$NAME" ]] && { echo "Usage: $0 --name <plan> [--max-mailboxes N] [--max-dbs N] [--quota N]"; exit 1; }

sudo virtualmin modify-plan --name "$NAME" "${EXTRA_ARGS[@]}"
echo "Plan '$NAME' updated."
