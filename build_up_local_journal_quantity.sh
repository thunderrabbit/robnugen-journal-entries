#!/bin/bash


####   BEGIN get files from ~/barefoot_rob_master/content/journal

LATEST_REMOTE_BRANCH=$(~/journal/untracked_remote_journal_file_shower.sh)

# Given the branch name, checkout that branch locally
git pull
git checkout $LATEST_REMOTE_BRANCH

####   END get files from ~/barefoot_rob_master/content/journal

