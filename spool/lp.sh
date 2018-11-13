#!/bin/bash

PATH_FILE=$1;
USERNAME=$USER;

 _verify_user_quota() {
    QUOTA=$(cat quota.txt);
    VERIFIED_USER=$1;
    QUOTA_USED=$(cat user-status.txt | grep $VERIFIED_USER | awk '{print $2}');

    if [ -z $1] ; then
        echo "User not allowed to print";
    if [ $QUOTA_USED -gt $QUOTA ] ; then
        echo "Quota exceeded!";
        exit 1;
    else
        echo "Everything OK!";
        exit 0;
    fi
}

_update_quota_used() {
    CONSUMED=$1;
    sed -i '/'"$USERNAME"'/ s/[0-9]\+/'"$CONSUMED"'/g' user-status.txt
}

_total_pages() {
    FILE_PATH=$1;
    FILE_SIZE=$(ls -l $FILE_PATH | awk '{print $5}');
    echo "a=$FILE_PATH; b=3600; if ( a%b ) a/b+1 else a/b" | bc;
}

_log() {
    TASK_STATUS=$1;
    PAGE=$2;
    NOW="$(date +\%F) $(date +\%T)";
    LOG_TEXT="$NOW $USERNAME $PATH_FILE $PAGE $TASK_STATUS";
    echo $LOG_TEXT >> log.txt;
    echo "$TASK_STATUS";
}

STATUS=$(_verify_user_quota $USERNAME);

if [ $? -eq 0 ] ; then
    USER_QUOTA=$(cat user-status.txt | grep "$USERNAME" | awk '{print $2}');
    TOTAL_PAGES=$(_total_pages $PATH_FILE);
    USED_PAGES=$(expr $USER_QUOTA + $TOTAL_PAGES);
    _update_quota_used $USED_PAGES;
    _log "Success!" $TOTAL_PAGES;
    # Call the original lp command
    # lp-orig $PATH_FILE
else
    _log "$STATUS" $(_total_pages $PATH_FILE);
fi
