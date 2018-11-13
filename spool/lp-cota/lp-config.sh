#!/bin/bash
function generate-users-prints {
    users=`ls /home`;
    echo "User Consumed" > files/users-prints.txt;
    echo "$users" | awk '{print $1 " " 0}' >> files/users-prints.txt;
    echo "root 0" >> files/users-prints.txt;
}

function update {
    quota=$(cat files/quota.txt);
    awk -v quota=$quota '{ if (NR == 1) print $1 " " $2 } {if (NR != 1 && $2 - quota > 0) print $1 " " $2 - quota; else if (NR != 1) print $1 " "  0;}' files/users-prints.txt > temp.txt;
    mv temp.txt files/users-prints.txt;    
}

case $1 in 
    --update)
	    echo "updating...";
	    update;
    ;;
    --quota)
        echo "Replacing the old quota...";
        new_quota=$2;
        echo $new_quota > files/quota.txt;
    ;;
    --generate-users-prints)
        echo "Generatings new user status file...";
        echo "Full log: " > files/log.txt;
        generate-users-prints;
    ;;
    *)
        echo "Invalid.";
    ;;
esac