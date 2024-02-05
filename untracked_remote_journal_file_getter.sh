#!/bin/bash
# This is designed to get files that exist on my journal Micropub server endpoint but not included in the journal repo
#
# 3 January 2021
#

REMOTE_UNTRACKED_FILES="$1"

# REMOTE_JOURNAL_DIR should match ~/journal/untracked_remote_journal_file_shower.sh
REMOTE_JOURNAL_DIR='~/barefoot_rob_journal/content/journal'         # must be in single quotes so ~ does not expand locally.
REMOTE_JUSTIN_CASE='~/untracked_files_copied_to_local_box'  # must be in single quotes so ~ does not expand locally.

while read -r line; do
    mkdir -p $(dirname $line);
    scp -F ~/.ssh/config_no_visual_keys bfr:$REMOTE_JOURNAL_DIR/$line $line
    if [ $? -eq 0 ]; then
        echo copy OK
      	echo moving remote file to $REMOTE_JUSTIN_CASE
      	# https://stackoverflow.com/a/9393147/194309 -n keeps ssh from breaking while loop
      	ssh -n -F ~/.ssh/config_no_visual_keys bfr "mv $REMOTE_JOURNAL_DIR/$line $REMOTE_JUSTIN_CASE"
    else
        echo copy FAIL
        echo trying next file   # if one file failed, no reason to give up on the others
    fi
done <<< "$REMOTE_UNTRACKED_FILES"
