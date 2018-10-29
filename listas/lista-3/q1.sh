#!/bin/bash

PATH_=$1
OPTION=$2

find $PATH_ -type $OPTION | wc -l
