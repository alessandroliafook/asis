#!/bin/bash

PATH_=$1

find $PATH_ -name '*.java' | wc -l
