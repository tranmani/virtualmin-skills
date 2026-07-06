#!/bin/bash
# Name: virtualmin-list-rs-containers
# Description: List all Rackspace Cloud Files containers for an account
# skills.sh: virtualmin, rackspace, hosting
# Usage: sudo bash list-rs-containers.sh --account myaccount

set -euo pipefail

ACCOUNT=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --account) ACCOUNT="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$ACCOUNT" ]] && { echo "Usage: $0 --account <rs-account>"; exit 1; }

sudo virtualmin list-rs-containers --account "$ACCOUNT"
