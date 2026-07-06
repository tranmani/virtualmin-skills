#!/bin/bash
# Name: virtualmin-list-ip-mappings
# Description: List IP address to virtual server mappings
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash list-ip-mappings.sh
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-ip-mappings/

set -euo pipefail
sudo virtualmin list-ip-mappings
