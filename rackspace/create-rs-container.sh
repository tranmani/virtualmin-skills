#!/bin/bash
# Name: virtualmin-create-rs-container
# Description: Create a new Rackspace Cloud Files container
# skills.sh: virtualmin, rackspace, backup, hosting
# Usage: sudo bash create-rs-container.sh --account myaccount --container mycontainer
# Docs:  https://www.virtualmin.com/docs/development/api-programs/create-rs-container/

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

sudo virtualmin create-rs-container --account "$ACCOUNT" --container "$CONTAINER"
echo "Rackspace container $CONTAINER created."
