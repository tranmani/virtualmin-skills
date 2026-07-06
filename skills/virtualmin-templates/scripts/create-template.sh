#!/bin/bash
# Name: virtualmin-create-template
# Description: Create a new server template for use when creating domains
# skills.sh: virtualmin, templates, hosting
# Usage: sudo bash create-template.sh --name mytemplate --desc "Standard template"
# Docs:  https://www.virtualmin.com/docs/development/api-programs/create-template/

set -euo pipefail

NAME=""
DESC=""
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --name) NAME="$2"; shift ;;
    --desc) DESC="$2"; shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$NAME" ]] && { echo "Usage: $0 --name <template-name> [--desc <description>]"; exit 1; }

ARGS=(--name "$NAME")
[[ -n "$DESC" ]] && ARGS+=(--desc "$DESC")

sudo virtualmin create-template "${ARGS[@]}" "${EXTRA_ARGS[@]}"
echo "Template $NAME created."
