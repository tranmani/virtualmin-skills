#!/bin/bash
# Name: virtualmin-list-scheduled-backups
# Description: List all scheduled Virtualmin backup jobs
# skills.sh: virtualmin, backup, hosting
# Usage: sudo bash list-scheduled-backups.sh
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-scheduled-backups/

set -euo pipefail

sudo virtualmin list-scheduled-backups
