#!/bin/bash
# Name: virtualmin-delete-template
# Description: Remove a virtual server template
# skills.sh: virtualmin, templates, hosting
# Usage: sudo bash delete-template.sh --name mytemplate
# Docs:  https://www.virtualmin.com/docs/development/api-programs/delete-template/

set -euo pipefail

NAME=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --name) NAME="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$NAME" ]] && { echo "Usage: $0 --name <template>"; exit 1; }

read -rp "Delete template $NAME? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-template --name "$NAME"
echo "Template $NAME deleted."
