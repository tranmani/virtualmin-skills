#!/bin/bash
# Name: virtualmin-create-s3-bucket
# Description: Create a new Amazon S3 bucket via Virtualmin
# skills.sh: virtualmin, s3, backup, hosting
# Usage: sudo bash create-s3-bucket.sh --account myaccount --bucket mybucket

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

[[ -z "$ACCOUNT" || -z "$BUCKET" ]] && { echo "Usage: $0 --account <s3-account> --bucket <bucket-name>"; exit 1; }

sudo virtualmin create-s3-bucket --account "$ACCOUNT" --bucket "$BUCKET"
echo "S3 bucket $BUCKET created."
