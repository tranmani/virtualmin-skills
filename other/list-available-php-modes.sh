#!/bin/bash
# Name: virtualmin-list-available-php-modes
# Description: List PHP execution modes (CGI, FPM, mod_php, etc.) available on the system
# skills.sh: virtualmin, other, php, hosting
# Usage: sudo bash list-available-php-modes.sh
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-available-php-modes/

set -euo pipefail
sudo virtualmin list-available-php-modes
