#!/bin/bash
# This is designed to show the name of the branch that HEAD is pointing to on the remote server.

# REMOTE_JOURNAL_DIR should match ~/journal/untracked_remote_journal_file_getter.sh
REMOTE_JOURNAL_DIR='~/barefoot_rob_journal/content/journal'    #REMOTE_JOURNAL_DIR must be in single quotes so ~ does not expand locally.

# Execute git log command and capture the output
ssh -F ~/.ssh/config_no_visual_keys bfr "cd $REMOTE_JOURNAL_DIR; git log --oneline --decorate -n 1" > branch_info.txt

# Extract the branch name from the commit message
BRANCH_NAME=$(grep -oP '\((HEAD -> )?(\w+)' < branch_info.txt | sed 's/HEAD -> //')

# Remove the extra open parenthesis if present
BRANCH_NAME=${BRANCH_NAME#(}

echo $BRANCH_NAME