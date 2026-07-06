#!/bin/bash
# Name: virtualmin-delete-php-directory
# Description: Remove a per-directory PHP version override for a domain
# skills.sh: virtualmin, php, hosting
# Usage: sudo bash delete-php-directory.sh --domain example.com --dir /home/example/public_html/app
# Docs:  https://www.virtualmin.com/docs/development/api-programs/delete-php-directory/

set -euo pipefail

DOMAIN=""
DIR=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --dir)    DIR="$2";    shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$DIR" ]] && { echo "Usage: $0 --domain <domain> --dir <path>"; exit 1; }

sudo virtualmin delete-php-directory --domain "$DOMAIN" --dir "$DIR"
echo "PHP directory override removed for $DIR."
