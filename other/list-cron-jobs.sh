#!/bin/bash
# Name: virtualmin-list-cron-jobs
# Description: List cron jobs configured for a virtual server's Unix user
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash list-cron-jobs.sh --domain example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-cron-jobs/

set -euo pipefail

DOMAIN=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain>"; exit 1; }

sudo virtualmin list-cron-jobs --domain "$DOMAIN"
