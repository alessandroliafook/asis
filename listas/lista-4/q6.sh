#!/bin/bash

finger | awk '{if ($(NF-4) !~ /[pL]/) print $(NF-4),$1}' | sort -g | tail -1
