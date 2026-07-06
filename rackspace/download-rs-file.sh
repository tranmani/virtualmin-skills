#!/bin/bash
# Name: virtualmin-download-rs-file
# Description: Download a file from a Rackspace Cloud Files container
# skills.sh: virtualmin, rackspace, hosting
# Usage: sudo bash download-rs-file.sh --account myaccount --container mycontainer --file backup.tar.gz --dest /tmp/

set -euo pipefail

ACCOUNT=""
CONTAINER=""
FILE=""
DEST="."

while [[ $# -gt 0 ]]; do
  case $1 in
    --account)   ACCOUNT="$2";   shift ;;
    --container) CONTAINER="$2"; shift ;;
    --file)      FILE="$2";      shift ;;
    --dest)      DEST="$2";      shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$ACCOUNT" || -z "$CONTAINER" || -z "$FILE" ]] && {
  echo "Usage: $0 --account <rs-account> --container <name> --file <filename> [--dest <dir>]"
  exit 1
}

sudo virtualmin download-rs-file --account "$ACCOUNT" --container "$CONTAINER" --file "$FILE" --dest "$DEST"
echo "$FILE downloaded to $DEST."
