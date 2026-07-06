#!/bin/bash
# Name: virtualmin-search-maillogs
# Description: Search Postfix mail logs for messages matching criteria
# skills.sh: virtualmin, mail, hosting
# Usage: sudo bash search-maillogs.sh --from sender@example.com [--to dest@example.com] [--domain example.com]
# Docs:  https://www.virtualmin.com/docs/development/api-programs/search-maillogs/

set -euo pipefail

EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --from|--to|--domain|--start|--end|--max) EXTRA_ARGS+=("$1" "$2"); shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ ${#EXTRA_ARGS[@]} -eq 0 ]] && {
  echo "Usage: $0 --from <email>|--to <email>|--domain <domain> [--start 'YYYY-MM-DD'] [--end 'YYYY-MM-DD'] [--max N]"
  exit 1
}

sudo virtualmin search-maillogs "${EXTRA_ARGS[@]}"
