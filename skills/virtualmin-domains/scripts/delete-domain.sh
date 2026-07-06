#!/bin/bash
# Name: virtualmin-delete-domain
# Description: Delete a Virtualmin virtual server and all its data
# Author: tranmani
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash delete-domain.sh --domain example.com
# Docs:  https://www.virtualmin.com/docs/development/api-programs/delete-domain/

set -euo pipefail

DOMAIN=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain>"; exit 1; }

read -rp "WARNING: This will permanently delete $DOMAIN and all its data. Type the domain name to confirm: " CONFIRM
[[ "$CONFIRM" != "$DOMAIN" ]] && { echo "Aborted."; exit 1; }

sudo virtualmin delete-domain --domain "$DOMAIN"
echo "Domain $DOMAIN deleted."
