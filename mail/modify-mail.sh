#!/bin/bash
# Name: virtualmin-modify-mail
# Description: Change mail settings for a Virtualmin domain (spam, limits, aliases)
# Author: tranmani
# skills.sh: virtualmin, mail, hosting
# Usage: sudo bash modify-mail.sh --domain example.com --spam yes|no --virus yes|no

set -euo pipefail

DOMAIN=""
SPAM=""
VIRUS=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --spam)   SPAM="$2";   shift ;;
    --virus)  VIRUS="$2";  shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" ]] && { echo "Usage: $0 --domain <domain> [--spam yes|no] [--virus yes|no]"; exit 1; }

ARGS=(--domain "$DOMAIN")
[[ -n "$SPAM" ]]  && ARGS+=(--spam-delivery "$SPAM")
[[ -n "$VIRUS" ]] && ARGS+=(--virus-delivery "$VIRUS")

sudo virtualmin modify-spam "${ARGS[@]}"
echo "Mail settings updated for $DOMAIN."
