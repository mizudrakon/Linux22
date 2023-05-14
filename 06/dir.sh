#!/bin/bash
args=("$@")
if [ ${#args[@]} -lt 1 ]; then
    args=(`ls`)
fi
i=0
O=""
while [ $i -lt ${#args[@]} ]
do
    FC=${args[$i]}
    S=`stat -c %s $FC` 2>/dev/null
    if [ $? -lt 0 ]
    then
        echo "$FC: no such file or directory." 1>&2
    else
        SC="<special>"
        if [ -f $FC ]
        then
            SC=$S
        fi
        if [ -d $FC ]
        then
            SC="<dir>"
        fi
        echo "$FC $SC" >> test
        O="$O$FC $SC\n"
    fi
    i=$((i+1))
done
echo -e $O | column --table --table-noheadings --table-columns FILENAME,SIZE --table-right SIZE