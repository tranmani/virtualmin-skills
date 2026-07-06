#!/bin/bash
# Name: virtualmin-download-s3-file
# Description: Download a file from an Amazon S3 bucket
# skills.sh: virtualmin, s3, hosting
# Usage: sudo bash download-s3-file.sh --account myaccount --bucket mybucket --file backup.tar.gz --dest /tmp/

set -euo pipefail

ACCOUNT=""
BUCKET=""
FILE=""
DEST="."

while [[ $# -gt 0 ]]; do
  case $1 in
    --account) ACCOUNT="$2"; shift ;;
    --bucket)  BUCKET="$2";  shift ;;
    --file)    FILE="$2";    shift ;;
    --dest)    DEST="$2";    shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$ACCOUNT" || -z "$BUCKET" || -z "$FILE" ]] && {
  echo "Usage: $0 --account <s3-account> --bucket <bucket> --file <filename> [--dest <local-dir>]"
  exit 1
}

sudo virtualmin download-s3-file --account "$ACCOUNT" --bucket "$BUCKET" --file "$FILE" --dest "$DEST"
echo "$FILE downloaded to $DEST."
