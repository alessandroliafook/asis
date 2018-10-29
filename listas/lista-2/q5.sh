#!/bin/bash

ls -Rl $1 | grep ^d | wc -l
