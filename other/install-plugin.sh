#!/bin/bash
# Name: virtualmin-install-plugin
# Description: Install a Virtualmin plugin from a URL or file
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash install-plugin.sh --source /path/to/plugin.tar.gz

set -euo pipefail

SOURCE=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --source) SOURCE="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$SOURCE" ]] && { echo "Usage: $0 --source <url-or-path>"; exit 1; }

sudo virtualmin install-plugin --source "$SOURCE"
echo "Plugin installed."
