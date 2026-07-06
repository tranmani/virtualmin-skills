#!/bin/bash
# Name: virtualmin-upload-s3-file
# Description: Upload a file to an Amazon S3 bucket
# skills.sh: virtualmin, s3, hosting
# Usage: sudo bash upload-s3-file.sh --account myaccount --bucket mybucket --file /path/to/file.tar.gz

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
  echo "Usage: $0 --account <s3-account> --bucket <bucket> --file <local-path>"
  exit 1
}

[[ ! -f "$FILE" ]] && { echo "File not found: $FILE"; exit 1; }

sudo virtualmin upload-s3-file --account "$ACCOUNT" --bucket "$BUCKET" --file "$FILE"
echo "$(basename "$FILE") uploaded to s3://$BUCKET."
