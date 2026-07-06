#!/bin/bash
# Name: virtualmin-get-dns-resolver
# Description: Show the DNS resolver settings used by Virtualmin
# skills.sh: virtualmin, other, dns, hosting
# Usage: sudo bash get-dns-resolver.sh

set -euo pipefail
sudo virtualmin get-dns-resolver
