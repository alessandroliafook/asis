#!/bin/bash

#: << test
while read -p "$USER@$(hostname -f): $PWD$ " CMD  
    do
        
        if [ "$CMD" = "exit" ]; 
        then 
            break 
        fi

        A=$(type $CMD | grep -wc "builtin")

        if [ $A \> 0 ];
        then
                $CMD
        else
            DATE=$(date '+%Y %m')
            time --output=log -a -f "$DATE %C %U %S" $CMD;
        fi

    done