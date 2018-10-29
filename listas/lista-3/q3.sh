#!/bin/bash

PATH_=$1
PERMISSION=$2
find $PATH_ -type f -perm $PERMISSION
