#!/bin/bash
# Name: virtualmin-list-templates
# Description: List all available virtual server templates
# skills.sh: virtualmin, templates, hosting
# Usage: sudo bash list-templates.sh [--name-only]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-templates/

set -euo pipefail

EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --name-only|--multiline) EXTRA_ARGS+=("$1") ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

sudo virtualmin list-templates "${EXTRA_ARGS[@]}"
