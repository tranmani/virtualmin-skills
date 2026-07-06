#!/bin/bash
# Name: virtualmin-get-template
# Description: Output all settings in a virtual server template
# skills.sh: virtualmin, templates, hosting
# Usage: sudo bash get-template.sh --name mytemplate

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

sudo virtualmin get-template --name "$NAME"
