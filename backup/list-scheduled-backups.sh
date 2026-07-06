#!/bin/bash
# Name: virtualmin-list-scheduled-backups
# Description: List all scheduled Virtualmin backup jobs
# skills.sh: virtualmin, backup, hosting
# Usage: sudo bash list-scheduled-backups.sh

set -euo pipefail

sudo virtualmin list-scheduled-backups
