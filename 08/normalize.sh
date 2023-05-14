#!/bin/bash
set -ueo pipefail
echo "$1" | sed "
: loop
    s:/\./:/:g
    s:/[^/\.\.]*/\.\./:/:g
    s:^[^/\.\.]*/\.\./::
    t loop
"