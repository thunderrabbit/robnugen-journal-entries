#!/bin/bash
# This is designed to get files that exist on my journal Micropub server endpoint but not included in the journal repo
#
# 3 January 2021
#

REMOTE_UNTRACKED_FILES="$@"

while read -r line; do
    echo "... $line ..."
done <<< "$REMOTE_UNTRACKED_FILES"

