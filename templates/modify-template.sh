#!/bin/bash
# Name: virtualmin-modify-template
# Description: Change one or more settings in a virtual server template
# skills.sh: virtualmin, templates, hosting
# Usage: sudo bash modify-template.sh --name mytemplate --set quota --value 5000
# Docs:  https://www.virtualmin.com/docs/development/api-programs/modify-template/

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

[[ -z "$NAME" ]] && { echo "Usage: $0 --name <template> --set <setting> --value <value>"; exit 1; }

sudo virtualmin modify-template --name "$NAME" "${EXTRA_ARGS[@]}"
echo "Template $NAME updated."
