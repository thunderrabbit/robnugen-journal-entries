#!/bin/bash


####   BEGIN get files from ~/barefoot_rob_master/content/journal

LATEST_REMOTE_BRANCH=$(~/journal/untracked_remote_journal_file_shower.sh)

# Given the branch name, checkout that branch locally
git pull
git checkout $LATEST_REMOTE_BRANCH

# MASTER_COMMIT_FILE="x0x0x0"

# # Function to check if a commit matches the expected message
# check_commit() {
#     local commit=$1
#     local message=$2
#     local expected_message=$(echo "$message" | tr -d '\n')

#     # Check if the commit message matches the expected message
#     if [[ "${commit:0:2}" == "co" ]] && [[ "$(git log -1 --format=%B $commit)" == "$expected_message" ]]; then
#         return 0
#     else
#         return 1
#     fi
# }

# # Function to process commits
# process_commits() {
#     local current_branch=$1
#     local target_branch=$2

#     echo "Processing commits from $current_branch to $target_branch"

#     while IFS= read -r commit; do
#         if [[ -z "$commit" ]]; then
#             continue
#         fi

#         local message=$(cat "$MASTER_COMMIT_FILE" | grep "^$commit$" | tail -n 1)
#         if [[ -z "$message" ]]; then
#             echo "Warning: No matching message found for commit $commit"
#             continue
#         fi

#         if ! check_commit "$commit" "$message"; then
#             echo "Commit $commit does not match expected message '$message'"
#             echo "Updating commit message..."

#             # Create a new commit with the correct message
#             git commit --amend -m "$message"

#             echo "Updated commit message for $commit"
#         else
#             echo "Commit $commit matches expected message"
#         fi
#     done < <(git log --first-parent $current_branch..$target_branch --format='%H')
# }

# # Process commits from master to the latest remote branch
# process_commits "master" "$LATEST_REMOTE_BRANCH"


####   END get files from ~/barefoot_rob_master/content/journal

