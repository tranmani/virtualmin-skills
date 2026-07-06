#!/bin/bash
# Name: virtualmin-list-backup-logs
# Description: List logs of backups that have been run
# skills.sh: virtualmin, backup, hosting
# Usage: sudo bash list-backup-logs.sh

set -euo pipefail

sudo virtualmin list-backup-logs
