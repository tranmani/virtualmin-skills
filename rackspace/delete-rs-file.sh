#!/bin/bash
# Name: virtualmin-delete-rs-file
# Description: Delete a single file from a Rackspace Cloud Files container
# skills.sh: virtualmin, rackspace, hosting
# Usage: sudo bash delete-rs-file.sh --account myaccount --container mycontainer --file oldbackup.tar.gz

set -euo pipefail

ACCOUNT=""
CONTAINER=""
FILE=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --account)   ACCOUNT="$2";   shift ;;
    --container) CONTAINER="$2"; shift ;;
    --file)      FILE="$2";      shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$ACCOUNT" || -z "$CONTAINER" || -z "$FILE" ]] && {
  echo "Usage: $0 --account <rs-account> --container <name> --file <filename>"
  exit 1
}

sudo virtualmin delete-rs-file --account "$ACCOUNT" --container "$CONTAINER" --file "$FILE"
echo "$FILE deleted from $CONTAINER."
