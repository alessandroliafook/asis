#!/bin/bash

DIRETORIO=$1

find $DIRETORIO -type f -exec grep -l "KEY" {} \;


