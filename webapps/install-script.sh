#!/bin/bash
# Name: virtualmin-install-script
# Description: Install a web app script (WordPress, phpMyAdmin, etc.) into a domain
# skills.sh: virtualmin, webapps, hosting
# Usage: sudo bash install-script.sh --domain example.com --type wordpress --version latest --path /blog

set -euo pipefail

DOMAIN=""
TYPE=""
VERSION="latest"
EXTRA_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)  DOMAIN="$2";  shift ;;
    --type)    TYPE="$2";    shift ;;
    --version) VERSION="$2"; shift ;;
    *) EXTRA_ARGS+=("$1") ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$TYPE" ]] && {
  echo "Usage: $0 --domain <domain> --type <wordpress|phpmyadmin|drupal|...> [--version latest|X.Y] [--path /subdir] [--db 'mysql dbname'] [--newdb]"
  exit 1
}

sudo virtualmin install-script --domain "$DOMAIN" --type "$TYPE" --version "$VERSION" "${EXTRA_ARGS[@]}"
echo "$TYPE installed on $DOMAIN."
