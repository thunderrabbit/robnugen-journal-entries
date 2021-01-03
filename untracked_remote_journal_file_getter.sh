#!/bin/bash
# This is designed to get files that exist on my journal Micropub server endpoint but not included in the journal repo
#
# 3 January 2021
#

REMOTE_UNTRACKED_FILES="$1"

# REMOTE_JOURNAL_DIR should match ~/journal/untracked_remote_journal_file_shower.sh
REMOTE_JOURNAL_DIR='~/barefoot_rob/content/journal'    #REMOTE_JOURNAL_DIR must be in single quotes so ~ does not expand locally.

while read -r line; do
    echo "scp -F ~/.ssh/config_no_visual_keys hpc:$REMOTE_JOURNAL_DIR/$line $line"
done <<< "$REMOTE_UNTRACKED_FILES"
