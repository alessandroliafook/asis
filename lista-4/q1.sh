#!/bin/bash

grep -nm 5 atom entrada | tail -1 | awk -F : '{print $1}'
