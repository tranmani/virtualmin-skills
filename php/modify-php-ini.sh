#!/bin/bash
# Name: virtualmin-modify-php-ini
# Description: Set a PHP ini configuration value for a domain
# skills.sh: virtualmin, php, hosting
# Usage: sudo bash modify-php-ini.sh --domain example.com --ini upload_max_filesize --value 64M
# Docs:  https://www.virtualmin.com/docs/development/api-programs/modify-php-ini/

set -euo pipefail

DOMAIN=""
INI=""
VALUE=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --ini)    INI="$2";    shift ;;
    --value)  VALUE="$2";  shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$INI" || -z "$VALUE" ]] && {
  echo "Usage: $0 --domain <domain> --ini <setting> --value <value>"
  exit 1
}

sudo virtualmin modify-php-ini --domain "$DOMAIN" --ini "$INI" --value "$VALUE"
echo "PHP ini $INI=$VALUE set for $DOMAIN."
