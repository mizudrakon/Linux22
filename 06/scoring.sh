#!/bin/bash
my_temp="$(mktemp -d)"
while read name score
do
    if [ -f "$my_temp/$name" ]
    then
        echo $(($(cat $name)+$score)) > $my_temp/$name
    else
        echo $score > $my_temp/$name
done
O=""
for fl in $(ls $my_temp)
do
    O="$O$fl $(cat $fl)\n"
done
echo -e $O | column --table --table-noheadings --table-columns FILENAME,SIZE --table-right SIZE
rm -r $my_temp