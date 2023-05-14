#!/bin/bash
sed "
    s:&:&amp\;:g
    s:<:\&lt\;:g
    s:>:\&gt\;:g
    s:\":\&quot;:g
    s:_\([^_]*\)_:<em>\1</em>:g
    s:\*\([^\*]*\)\*:<strong>\1</strong>:g
    s!\[\(http://\|https://\)\([^|]*\)|\([^]]*\)\]!<a href=\"\1\2\">\3</a>!g
" </dev/stdin