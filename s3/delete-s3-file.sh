#!/bin/bash
# Name: virtualmin-delete-s3-file
# Description: Delete a single file from an Amazon S3 bucket
# skills.sh: virtualmin, s3, hosting
# Usage: sudo bash delete-s3-file.sh --account myaccount --bucket mybucket --file oldbackup.tar.gz
# Docs:  https://www.virtualmin.com/docs/development/api-programs/delete-s3-file/

set -euo pipefail

ACCOUNT=""
BUCKET=""
FILE=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --account) ACCOUNT="$2"; shift ;;
    --bucket)  BUCKET="$2";  shift ;;
    --file)    FILE="$2";    shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$ACCOUNT" || -z "$BUCKET" || -z "$FILE" ]] && {
  echo "Usage: $0 --account <s3-account> --bucket <bucket> --file <filename>"
  exit 1
}

sudo virtualmin delete-s3-file --account "$ACCOUNT" --bucket "$BUCKET" --file "$FILE"
echo "$FILE deleted from s3://$BUCKET."
