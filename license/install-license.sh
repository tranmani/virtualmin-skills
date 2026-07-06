#!/bin/bash
# Name: virtualmin-install-license
# Description: Install a new Virtualmin license from the Virtualmin store
# skills.sh: virtualmin, license, hosting
# Usage: sudo bash install-license.sh --serial 12345 --key ABCDE

set -euo pipefail

SERIAL=""
KEY=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --serial) SERIAL="$2"; shift ;;
    --key)    KEY="$2";    shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$SERIAL" || -z "$KEY" ]] && { echo "Usage: $0 --serial <serial> --key <key>"; exit 1; }

sudo virtualmin install-license --serial "$SERIAL" --key "$KEY"
echo "License $SERIAL installed."
