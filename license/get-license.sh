#!/bin/bash
# Name: virtualmin-get-license
# Description: Display the current Virtualmin license details and status
# skills.sh: virtualmin, license, hosting
# Usage: sudo bash get-license.sh
# Docs:  https://www.virtualmin.com/docs/development/api-programs/get-license/

set -euo pipefail

sudo virtualmin get-license
