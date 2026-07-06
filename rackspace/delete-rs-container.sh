#!/bin/bash
# Name: virtualmin-delete-rs-container
# Description: Delete a Rackspace Cloud Files container and all its files
# skills.sh: virtualmin, rackspace, hosting
# Usage: sudo bash delete-rs-container.sh --account myaccount --container mycontainer

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

read -rp "Delete Rackspace container $CONTAINER and ALL files? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-rs-container --account "$ACCOUNT" --container "$CONTAINER"
echo "Container $CONTAINER deleted."
