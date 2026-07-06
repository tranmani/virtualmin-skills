#!/bin/bash
# Name: virtualmin-delete-script
# Description: Remove an installed web app script from a domain
# skills.sh: virtualmin, webapps, hosting
# Usage: sudo bash delete-script.sh --domain example.com --type wordpress --path /blog

set -euo pipefail

DOMAIN=""
TYPE=""
PATH_ARG=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --type)   TYPE="$2";   shift ;;
    --path)   PATH_ARG="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$TYPE" ]] && { echo "Usage: $0 --domain <domain> --type <app> [--path /subdir]"; exit 1; }

read -rp "Delete $TYPE from $DOMAIN? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

ARGS=(--domain "$DOMAIN" --type "$TYPE")
[[ -n "$PATH_ARG" ]] && ARGS+=(--path "$PATH_ARG")

sudo virtualmin delete-script "${ARGS[@]}"
echo "$TYPE deleted from $DOMAIN."
