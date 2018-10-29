#!/bin/bash

who | awk '{print $3,$4,$1 | "uniq | sort"}'
