#!/bin/bash


####   BEGIN get files from ~/barefoot_rob_master/content/journal

REMOTE_UNTRACKED_FILES=$(~/journal/untracked_remote_journal_file_shower.sh)

echo $REMOTE_UNTRACKED_FILES

if [ -n "$REMOTE_UNTRACKED_FILES" ]   # check non-zero length
    then
	echo "Here are untracked remote files I'll get."
        while read -r line; do
              echo "$line"
        done <<< "$REMOTE_UNTRACKED_FILES"

        echo Calling script to get the files, then exiting
	~/journal/untracked_remote_journal_file_getter.sh "$REMOTE_UNTRACKED_FILES"
fi

####   END get files from ~/barefoot_rob_master/content/journal

