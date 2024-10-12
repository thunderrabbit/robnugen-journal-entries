#!/bin/bash
# This is designed to get files that exist on my journal Micropub server endpoint but not included in the journal repo
#
# 3 January 2021
#

REMOTE_UNTRACKED_FILES="$1"

# REMOTE_JOURNAL_DIR should match ~/journal/untracked_remote_journal_file_shower.sh
REMOTE_JOURNAL_DIR='~/barefoot_rob_journal/content/journal'         # must be in single quotes so ~ does not expand locally.
REMOTE_JUSTIN_CASE='~/untracked_files_copied_to_local_box'  # must be in single quotes so ~ does not expand locally.

# Prepare directory structure locally for the incoming files
echo "$REMOTE_UNTRACKED_FILES" | while read -r line; do
    mkdir -p $(dirname "$line")
done

# Loop over each file and execute the scp command individually
for line in $REMOTE_UNTRACKED_FILES; do
    SCP_CMD="scp -F ~/.ssh/config_no_visual_keys bfr:$REMOTE_JOURNAL_DIR/$line $line"
    echo "Executing: $SCP_CMD"
    eval $SCP_CMD
    if [ $? -eq 0 ]; then
        echo "File $line copied successfully."
        # Move the remote file to the just-in-case directory
        ssh -n -F ~/.ssh/config_no_visual_keys bfr "mv $REMOTE_JOURNAL_DIR/$line $REMOTE_JUSTIN_CASE"
    else
        echo "Failed to copy file $line."
    fi
done

