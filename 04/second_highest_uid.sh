#!/bin/bash
set -ueo pipefail
cat /dev/stdin | cut -d: -f3 | sort -n | tail -n2 | head -n1
