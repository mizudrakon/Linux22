#!/bin/bash
set -ueo pipefail
cat /dev/stdin | tr -s ' ' | tr '|' '0' | cut -d' ' -f 1- | tr ' ' '+' | bc
