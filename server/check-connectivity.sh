#!/bin/bash
# Name: virtualmin-check-connectivity
# Description: Test outbound network connectivity from the Virtualmin server
# skills.sh: virtualmin, server, hosting
# Usage: sudo bash check-connectivity.sh
# Docs:  https://www.virtualmin.com/docs/development/api-programs/check-connectivity/

set -euo pipefail

sudo virtualmin check-connectivity
