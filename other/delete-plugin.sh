#!/bin/bash
# Name: virtualmin-delete-plugin
# Description: Remove an installed Virtualmin plugin
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash delete-plugin.sh --name myplugin

set -euo pipefail

NAME=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --name) NAME="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$NAME" ]] && { echo "Usage: $0 --name <plugin>"; exit 1; }

read -rp "Delete plugin $NAME? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-plugin --name "$NAME"
echo "Plugin $NAME deleted."
