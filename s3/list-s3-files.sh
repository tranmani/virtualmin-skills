#!/bin/bash
# Name: virtualmin-list-s3-files
# Description: List files in an Amazon S3 bucket
# skills.sh: virtualmin, s3, hosting
# Usage: sudo bash list-s3-files.sh --account myaccount --bucket mybucket

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

sudo virtualmin list-s3-files --account "$ACCOUNT" --bucket "$BUCKET"
