#!/bin/bash
# Name: virtualmin-delete-s3-bucket
# Description: Delete an entire Amazon S3 bucket and all its contents
# skills.sh: virtualmin, s3, hosting
# Usage: sudo bash delete-s3-bucket.sh --account myaccount --bucket mybucket

set -euo pipefail

ACCOUNT=""
BUCKET=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --account) ACCOUNT="$2"; shift ;;
    --bucket)  BUCKET="$2";  shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$ACCOUNT" || -z "$BUCKET" ]] && { echo "Usage: $0 --account <s3-account> --bucket <bucket>"; exit 1; }

read -rp "Delete S3 bucket $BUCKET and ALL contents? [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin delete-s3-bucket --account "$ACCOUNT" --bucket "$BUCKET"
echo "S3 bucket $BUCKET deleted."
