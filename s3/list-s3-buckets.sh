#!/bin/bash
# Name: virtualmin-list-s3-buckets
# Description: List all S3 buckets for a Virtualmin S3 account
# skills.sh: virtualmin, s3, hosting
# Usage: sudo bash list-s3-buckets.sh --account myaccount
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-s3-buckets/

set -euo pipefail

ACCOUNT=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --account) ACCOUNT="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$ACCOUNT" ]] && { echo "Usage: $0 --account <s3-account>"; exit 1; }

sudo virtualmin list-s3-buckets --account "$ACCOUNT"
