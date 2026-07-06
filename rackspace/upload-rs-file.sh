#!/bin/bash
# Name: virtualmin-upload-rs-file
# Description: Upload a file to a Rackspace Cloud Files container
# skills.sh: virtualmin, rackspace, hosting
# Usage: sudo bash upload-rs-file.sh --account myaccount --container mycontainer --file /path/to/file.tar.gz

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
  echo "Usage: $0 --account <rs-account> --container <name> --file <local-path>"
  exit 1
}

[[ ! -f "$FILE" ]] && { echo "File not found: $FILE"; exit 1; }

sudo virtualmin upload-rs-file --account "$ACCOUNT" --container "$CONTAINER" --file "$FILE"
echo "$(basename "$FILE") uploaded to $CONTAINER."
