#!/bin/bash

_update_quota() {
    QUOTA=$(cat quota.txt);
    awk -v QUOTA=$QUOTA '{ if (NR == 1) print $1 " " $2 } {if (NR != 1 && $2 - QUOTA > 0) print $1 " " $2 - QUOTA; else if (NR != 1) print $1 " "  0;}' user-status.txt > temp.txt;
    mv temp.txt user-status.txt;    
}

_create_status_file() {
    USERS=`ls /home`;
    echo "User Consumed" > user-status.txt;
    echo "$USERS" | awk '{print $1 " " 0}' >> user-status.txt;
    echo "root 0" >> user-status.txt;
}

case $1 in 
    --refresh)
	    echo "Refreshing...";
	    _update_quota;
    ;;
    --quota)
        echo "Setting quota...";
        NEW_QUOTA=$2;
        echo $NEW_QUOTA > quota.txt;
    ;;
    --create-user-status)
        echo "Creating user status file...";
        echo "Date time user file pages status" > log.txt;
        _create_status_file;
    ;;
    *)
        echo "Option not found.";
    ;;
esac