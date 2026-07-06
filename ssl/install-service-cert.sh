#!/bin/bash
# Name: virtualmin-install-service-cert
# Description: Copy SSL cert from a virtual server to another service (postfix, dovecot, webmin)
# skills.sh: virtualmin, ssl, hosting
# Usage: sudo bash install-service-cert.sh --domain example.com --service postfix

set -euo pipefail

DOMAIN=""
SERVICE=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)  DOMAIN="$2";  shift ;;
    --service) SERVICE="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$SERVICE" ]] && {
  echo "Usage: $0 --domain <domain> --service <postfix|dovecot|webmin|proftpd>"
  exit 1
}

sudo virtualmin install-service-cert --domain "$DOMAIN" --service "$SERVICE"
echo "SSL cert from $DOMAIN installed to $SERVICE."
