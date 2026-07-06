#!/bin/bash
# Name: virtualmin-list-custom-fields
# Description: List all custom fields defined for virtual servers
# skills.sh: virtualmin, other, hosting
# Usage: sudo bash list-custom-fields.sh
# Docs:  https://www.virtualmin.com/docs/development/api-programs/list-custom-fields/

set -euo pipefail
sudo virtualmin list-custom-fields
