#!/bin/bash

who | grep alessandro | awk -F\( '{print $2}' | awk -F\) '{print $1}
