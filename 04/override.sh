#!/bin/bash
(test -f .NO_HEADER && exit 0) || ((test -f HEADER && cat HEADER) || (test ! -f HEADER && echo 'Error: HEADER not found.' >&2 && exit 1))
