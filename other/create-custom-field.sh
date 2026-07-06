#!/bin/bash
# Name: virtualmin-create-custom-field
# Description: Define a new custom field for virtual servers
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash create-custom-field.sh --name "Customer ID" --type text
# Docs:  https://www.virtualmin.com/docs/development/api-programs/create-custom-field/

set -euo pipefail

NAME=""
TYPE="text"
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --name) NAME="$2"; shift ;;
    --type) TYPE="$2"; shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$NAME" ]] && { echo "Usage: $0 --name <field-name> [--type text|select|check] [options...]"; exit 1; }

sudo virtualmin create-custom-field --name "$NAME" --type "$TYPE" "${EXTRA_ARGS[@]}"
echo "Custom field '$NAME' created."
