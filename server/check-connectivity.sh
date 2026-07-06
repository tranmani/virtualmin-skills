#!/bin/bash
# Name: virtualmin-check-connectivity
# Description: Test outbound network connectivity from the Virtualmin server
# skills.sh: virtualmin, server, hosting
# Usage: sudo bash check-connectivity.sh

set -euo pipefail

sudo virtualmin check-connectivity
