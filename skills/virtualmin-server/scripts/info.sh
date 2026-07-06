#!/bin/bash
# Name: virtualmin-info
# Description: Show overall Virtualmin server information and summary statistics
# skills.sh: virtualmin, server, hosting
# Usage: sudo bash info.sh
# Docs:  https://www.virtualmin.com/docs/development/api-programs/info/

set -euo pipefail

sudo virtualmin info
