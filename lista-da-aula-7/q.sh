#!/bin/sh

DIR=$1

if [ -z $DIR ]; then
    echo "Target directory is missing!"
    exit 2
fi

TOTAL_FILES=$(find $DIR -type f | wc -l)
TOTAL_DIR=$(find $DIR -type d | wc -l)

# Print data nicelly
printf "\nResume of \"%s\":\n\n" $DIR
printf "%10.d files.\n" $TOTAL_FILES
printf "%10.d directories.\n\n" $TOTAL_DIR

# Histograms.

echo "==============| HISTOGRAMS |=============="
# By blocks of 1024 bytes
printf "\nHistogram by blocks of 1024 bytes:\n\n"

TMP=$(find $DIR -type f | xargs ls -l)

echo $TMP
MAX_SIZE=$(echo "$TMP" | awk '{ print $5 }' | sort -n | tail -n1)
echo $MAX_SIZE
echo "$TMP" | awk -v max="$MAX_SIZE" '{ size[ int($5/1024) ]++ } END { for (i=0;i<=max/1024;i++) printf("%10d : %d\n", i*1024, size[i]) }' | sort -n

# By file extension
printf "\nHistogram by file extensions:\n\n"
find $DIR -type f  -exec basename {} \; | awk -F . '{map[$NF]++} END { for (i in map) printf("%s : %d\n", i, map[i]) }' | sort


