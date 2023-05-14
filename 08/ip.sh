#!/bin/bash
set -ueo pipefail
grep 404 </dev/stdin | cut -d' ' -f 1 | sort -u | sed '/^2/d'