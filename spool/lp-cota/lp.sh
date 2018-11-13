#!/bin/bash
files=$1;
user=$USER;

function insert_new_log {
    status=$1;
    npages=$2;
    cur_date="$(date +\%F) $(date +\%T)";
    msg="$cur_date $user $files $npages $status";
    echo $msg >> files/log.txt;
    echo "$status";
}

function check_quota {
    quota=$(cat files/quota.txt);
    user=$1;
    used_quota=$(cat files/users-prints.txt | grep $user | awk '{print $2}');

    if [ -z $1] ; then
        echo "User cant print anymore";
    if [ $used_quota -gt $quota ] ; then
        echo "Passed the quota!";
        exit 1;
    else
        echo "OK!";
        exit 0;
    fi
}

function set_used_quota {
    used_quota=$1;
    sed -i '/'"$user"'/ s/[0-9]\+/'"$used_quota"'/g' files/users-prints.txt
}

function count_pages {
    path=$1;
    size=$(ls -l $path | awk '{print $5}');
    echo "a=$size; b=3600; if ( a%b ) a/b+1 else a/b" | bc;
}

function root {
    status=$(check_quota $user);

    if [ $? -eq 0 ] ; then
        user_quota=$(cat user-status.txt | grep "$user" | awk '{print $2}');
        npages=$(count_pages $files);
        used_quota=$(expr $user_quota + $npages);
        set_used_quota $used_quota;
        insert_new_log "Success!" $npages;
    else
        insert_new_log "$status" $(count_pages $files);
    fi
}

root;