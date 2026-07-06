#!/bin/bash
# Name: virtualmin-set-php-directory
# Description: Set the PHP version to use for a specific directory in a domain
# skills.sh: virtualmin, php, hosting
# Usage: sudo bash set-php-directory.sh --domain example.com --dir /home/example/public_html/app --version 8.1
# Docs:  https://www.virtualmin.com/docs/development/api-programs/set-php-directory/

set -euo pipefail

DOMAIN=""
DIR=""
VERSION=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)  DOMAIN="$2";  shift ;;
    --dir)     DIR="$2";     shift ;;
    --version) VERSION="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$DIR" || -z "$VERSION" ]] && {
  echo "Usage: $0 --domain <domain> --dir <path> --version <8.1|8.2|7.4|...>"
  exit 1
}

sudo virtualmin set-php-directory --domain "$DOMAIN" --dir "$DIR" --version "$VERSION"
echo "PHP $VERSION set for $DIR on $DOMAIN."
