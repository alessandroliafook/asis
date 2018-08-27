#!/bin/bash

ls -Rl $1 | grep ^- | wc -l 
