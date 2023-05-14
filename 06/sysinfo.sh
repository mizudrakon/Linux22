#!/bin/bash
set -ueo pipefail
opts_short="lkchs"
opts_long="load,kernel,cpus,help,script"

getopt -Q -o "$opts_short" -l "$opts_long" -- "$@" || exit 1

eval set -- "$( getopt -o "$opts_short" -l "$opts_long" -- "$@" )"

L=false
K=false
C=false
S=false
while [ $# -gt 0 ]
do
    case "$1" in
        -h|--help)
            echo "prints load, kernel, cpus as specified by the options"
            exit 0
            ;;
        -l|--load)
            L=true
            shift
            ;;
        -k|--kernel)
            K=true
            shift
            ;;
        -c|--cpus)
            C=true
            shift
            ;;
        -s|--script)
            S=true
            shift
        *)
            echo "load=$(cat /proc/loadavg) kernel=$(uname -r) cpus=$(nproc)"
            exit 0
            ;;
    esac
    shift
done

O=""
if [ L ]; then
    O="${O}load=$(cat /proc/loadavg) "
    if [ S ]; then
        O="$O\n"
    fi
fi
if [ K ]; then
    O="${O}kernel=$(uname -r) "
    if [ S ]; then
        O="$O\n"
    fi
fi
if [ C ]; then
    O="${O}cpus=$(nproc) "
    if [ S ]; then
        O="$O\n"
    fi
fi
echo -e $O