#!/bin/bash
# Name: virtualmin-create-plan
# Description: Create a new account plan defining resource limits for virtual servers
# skills.sh: virtualmin, plans, hosting
# Usage: sudo bash create-plan.sh --name "Basic Plan" --max-mailboxes 10 --max-dbs 5

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

[[ -z "$NAME" ]] && { echo "Usage: $0 --name <plan-name> [--max-mailboxes N] [--max-dbs N] [--max-aliases N] [--quota N]"; exit 1; }

sudo virtualmin create-plan --name "$NAME" "${EXTRA_ARGS[@]}"
echo "Plan '$NAME' created."
