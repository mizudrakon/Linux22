#!/bin/bash
#convert every occurence of hh:mmAM or hh:mmPM and relpace it with hh:mm in 24h format
sed "$( for i in 0 1 2 3 4 5 6 7 8 9 10 11 ; do
    echo "s/0$i:\([0-9][0-9]\)PM/$(( i+12 )):\1/g"
    done )
    $( for i in 10 11 ; do 
    echo "s/$i:\([0-9][0-9]\)PM/$(( i+12 )):\1/g"
    done )
    s/\(\(0[0-9]\|1[01]\):[0-9][0-9]\)AM/\1/g
    s/12:\([0-9][0-9]\)AM/00:\1/g
    s/12:\([0-9][0-9]\)PM/12:\1/g
" </dev/stdin