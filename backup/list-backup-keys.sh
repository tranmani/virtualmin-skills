#!/bin/bash
# Name: virtualmin-list-backup-keys
# Description: List all available backup encryption keys
# skills.sh: virtualmin, backup, hosting
# Usage: sudo bash list-backup-keys.sh
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-backup-keys/

set -euo pipefail

sudo virtualmin list-backup-keys
