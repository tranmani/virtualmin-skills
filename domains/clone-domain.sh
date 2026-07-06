#!/bin/bash
# Name: virtualmin-clone-domain
# Description: Duplicate an existing virtual server with a new domain name
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash clone-domain.sh --domain source.com --newdomain clone.com

set -euo pipefail

DOMAIN=""
NEWDOMAIN=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain)    DOMAIN="$2";    shift ;;
    --newdomain) NEWDOMAIN="$2"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$NEWDOMAIN" ]] && { echo "Usage: $0 --domain <source> --newdomain <clone>"; exit 1; }

sudo virtualmin clone-domain --domain "$DOMAIN" --newdomain "$NEWDOMAIN"
echo "Cloned $DOMAIN → $NEWDOMAIN."
