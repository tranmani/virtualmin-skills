#!/bin/bash
# Name: virtualmin-transfer-domain
# Description: Move a virtual server to another Virtualmin system via SSH
# skills.sh: virtualmin, domains, hosting
# Usage: sudo bash transfer-domain.sh --domain example.com --host remote.server.com --user root
# Docs:  https://www.virtualmin.com/docs/development/api-programs/transfer-domain/

set -euo pipefail

DOMAIN=""
HOST=""
USER="root"

while [[ $# -gt 0 ]]; do
  case $1 in
    --domain) DOMAIN="$2"; shift ;;
    --host)   HOST="$2";   shift ;;
    --user)   USER="$2";   shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

[[ -z "$DOMAIN" || -z "$HOST" ]] && { echo "Usage: $0 --domain <domain> --host <remote-host> [--user <ssh-user>]"; exit 1; }

sudo virtualmin transfer-domain --domain "$DOMAIN" --host "$HOST" --user "$USER"
echo "$DOMAIN transferred to $HOST."
