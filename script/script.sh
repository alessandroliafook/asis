#!/bin/bash
#Authors: Alessandro Fook & Matheus Procópio

while read -p "$USER@$(hostname -f): $PWD$ " CMD  
    do
        
        if [ "$CMD" = "exit" ]; 
        then 
            break 
        fi

        PROGRAMS=$(echo $CMD | awk -F "|" '{out=""; for(i=1;i<=NF;i++){out=out"\n"$i}; print out}' | sed 's/ //g')

        BUILTIN=$(type $PROGRAMS | grep -wc "builtin")
        
        if [ $BUILTIN \> 0 ];
        then
                $CMD
        else
            DATE=$(date '+%Y %m')
            time --output=log -a -f "$DATE %C %U %S" $CMD;
        fi

    done