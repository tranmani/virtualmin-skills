#!/bin/bash
# Name: virtualmin-delete-custom-field
# Description: Remove a custom field definition from Virtualmin
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash delete-custom-field.sh --name "Customer ID"

set -euo pipefail

NAME=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --name) NAME="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$NAME" ]] && { echo "Usage: $0 --name <field-name>"; exit 1; }

read -rp "Delete custom field '$NAME'? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-custom-field --name "$NAME"
echo "Custom field '$NAME' deleted."
