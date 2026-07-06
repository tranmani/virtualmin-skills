#!/bin/bash
# Name: virtualmin-mass-update-domains
# Description: Apply a configuration change to all virtual servers at once
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash mass-update-domains.sh --all-domains --dns --fix-now

set -euo pipefail

EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  EXTRA_ARGS+=("$1")
  shift
done

[[ ${#EXTRA_ARGS[@]} -eq 0 ]] && {
  echo "Usage: $0 --all-domains [--dns] [--web] [--mail] [--ftp] [--fix-now]"
  exit 1
}

sudo virtualmin mass-update-domains "${EXTRA_ARGS[@]}"
echo "Mass domain update complete."
