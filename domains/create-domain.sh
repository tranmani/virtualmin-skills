#!/bin/bash
# Name: virtualmin-create-domain
# Description: Create a new Virtualmin virtual server (domain)
# Author: tranmani
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash create-domain.sh --domain example.com --user myuser --pass secret --email admin@example.com

set -euo pipefail

DOMAIN=""
USER=""
PASS=""
EMAIL=""
PLAN=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --user)   USER="$2";   shift ;;
    --pass)   PASS="$2";   shift ;;
    --email)  EMAIL="$2";  shift ;;
    --plan)   PLAN="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$USER" || -z "$PASS" || -z "$EMAIL" ]] && {
  echo "Usage: $0 --domain <domain> --user <username> --pass <password> --email <email> [--plan <plan>]"
  exit 1
}

PLAN_ARG=""
[[ -n "$PLAN" ]] && PLAN_ARG="--plan $PLAN"

sudo virtualmin create-domain \
  --domain "$DOMAIN" \
  --user "$USER" \
  --pass "$PASS" \
  --email "$EMAIL" \
  --web --dns --mail --mysql --ssl \
  $PLAN_ARG

echo "Domain $DOMAIN created successfully."
