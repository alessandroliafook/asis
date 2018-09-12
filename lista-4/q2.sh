#!/bin/bash

ls -l respostas/ | awk '{COUNTER+=$5} END {print COUNTER}'
