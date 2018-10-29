#!/bin/bash

who | grep $1 | awk '{print $3 " " $4}'
