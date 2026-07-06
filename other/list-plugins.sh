#!/bin/bash
# Name: virtualmin-list-plugins
# Description: List all installed Virtualmin plugins
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash list-plugins.sh

set -euo pipefail
sudo virtualmin list-plugins
