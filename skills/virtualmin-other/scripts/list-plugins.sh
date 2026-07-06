#!/bin/bash
# Name: virtualmin-list-plugins
# Description: List all installed Virtualmin plugins
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash list-plugins.sh
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-plugins/

set -euo pipefail
sudo virtualmin list-plugins
