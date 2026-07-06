#!/bin/bash
# Name: virtualmin-list-rs-files
# Description: List files in a Rackspace Cloud Files container
# skills.sh: virtualmin, rackspace, hosting
# Usage: sudo bash list-rs-files.sh --account myaccount --container mycontainer
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-rs-files/

set -euo pipefail

ACCOUNT=""
CONTAINER=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --account)   ACCOUNT="$2";   shift ;;
    --container) CONTAINER="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$ACCOUNT" || -z "$CONTAINER" ]] && { echo "Usage: $0 --account <rs-account> --container <name>"; exit 1; }

sudo virtualmin list-rs-files --account "$ACCOUNT" --container "$CONTAINER"
