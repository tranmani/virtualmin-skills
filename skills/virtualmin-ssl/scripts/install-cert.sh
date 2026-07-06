#!/bin/bash
# Name: virtualmin-install-cert
# Description: Install an existing SSL certificate and key for a domain
# skills.sh: virtualmin, ssl, hosting
# Usage: sudo bash install-cert.sh --domain example.com --cert /path/cert.pem --key /path/key.pem
# Docs:  https://www.virtualmin.com/docs/development/api-programs/install-cert/

set -euo pipefail

DOMAIN=""
CERT=""
KEY=""
CA=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --cert)   CERT="$2";   shift ;;
    --key)    KEY="$2";    shift ;;
    --ca)     CA="$2";     shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$CERT" || -z "$KEY" ]] && {
  echo "Usage: $0 --domain <domain> --cert <cert.pem> --key <key.pem> [--ca <chain.pem>]"
  exit 1
}

ARGS=(--domain "$DOMAIN" --cert "$CERT" --key "$KEY")
[[ -n "$CA" ]] && ARGS+=(--ca "$CA")

sudo virtualmin install-cert "${ARGS[@]}"
echo "Certificate installed for $DOMAIN."
