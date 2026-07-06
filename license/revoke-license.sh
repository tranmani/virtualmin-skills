#!/bin/bash
# Name: virtualmin-revoke-license
# Description: Revoke the current Virtualmin license and revert to GPL mode
# skills.sh: virtualmin, license, hosting
# Usage: sudo bash revoke-license.sh

set -euo pipefail

read -rp "Revoke Virtualmin license? Server will revert to GPL mode. [y/N]: " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Aborted."; exit 0; }

sudo virtualmin revoke-license
echo "License revoked. Running in GPL mode."
