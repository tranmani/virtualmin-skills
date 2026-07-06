#!/bin/bash
# Name: virtualmin-enable-ssl
# Description: Request and install a Let's Encrypt SSL certificate for a domain
# Author: tranmani
# skills.sh: virtualmin, ssl, letsencrypt, hosting
# Usage: sudo bash enable-ssl.sh --domain example.com --email admin@example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/enable-ssl/

set -euo pipefail

DOMAIN=""
EMAIL=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --email)  EMAIL="$2";  shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$EMAIL" ]] && {
  echo "Usage: $0 --domain <domain> --email <email>"
  exit 1
}

echo "Requesting Let's Encrypt certificate for $DOMAIN ..."
sudo virtualmin enable-feature --domain "$DOMAIN" --ssl
sudo virtualmin modify-web --domain "$DOMAIN" --letsencrypt --letsencrypt-email "$EMAIL"

echo "SSL enabled for $DOMAIN."
sudo virtualmin get-ssl --domain "$DOMAIN" | grep -E "Expiry|Subject"
