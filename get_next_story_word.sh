#!/bin/bash

# /home/thunderrabbit/work/rob/robnugen.com/journal/journal/get_next_story_word.sh

# Ensure strict error handling
set -e

# Change to script directory
cd "$(dirname "$0")"

# 1. Sync local repository
echo "Syncing local repository..." >&2
git pull -q >&2 || echo "Warning: Local git pull failed or timed out" >&2

# 2. Call server script
echo "Retrieving next story word from quick.robnugen.com..." >&2
SERVER_OUTPUT=$(ssh -o BatchMode=yes quick "php quick.robnugen.com/bin/get-next-story-word.php")
SSH_EXIT=$?

if [ $SSH_EXIT -ne 0 ]; then
    echo "Error: Failed to connect to server or execute script." >&2
    exit 1
fi

# 3. Parse output
SERVER_HASH=$(echo "$SERVER_OUTPUT" | grep "^HASH:" | cut -d':' -f2)
SERVER_WORD=$(echo "$SERVER_OUTPUT" | grep "^WORD:" | cut -d':' -f2-)

if [ -z "$SERVER_HASH" ]; then
    echo "Error: Server response did not contain a valid git hash." >&2
    echo "Raw Output:" >&2
    echo "$SERVER_OUTPUT" >&2
    exit 1
fi

# 4. Sync local repository again (catch any pushes from server)
echo "Syncing local repository with server changes..." >&2
git pull -q >&2 || echo "Warning: Local git pull failed or timed out" >&2

# 5. Compare hashes
LOCAL_HASH=$(git rev-parse HEAD)

if [ "$LOCAL_HASH" != "$SERVER_HASH" ]; then
    # Check if local is exactly 1 commit ahead
    # Get hash of commit before HEAD
    LOCAL_PREV_HASH=$(git rev-parse HEAD~1 2>/dev/null || echo "none")

    # Get message of current HEAD
    LOCAL_HEAD_MSG=$(git log -1 --pretty=format:'%s')

    # CASE B: Local is 1 commit ahead AND message matches server's expected next word
    if [ "$LOCAL_PREV_HASH" == "$SERVER_HASH" ] && [ "$LOCAL_HEAD_MSG" == "$SERVER_WORD" ]; then
        echo "" >&2
        echo "⚠️  Local repository is 1 commit ahead, but the commit message matches the next story word." >&2
        echo "   Message: '$LOCAL_HEAD_MSG'" >&2
        echo "   Action:  Will now auto-push to sync repositories..." >&2
        echo "" >&2

        # Capture stdout/stderr to keep script output clean
        if git push origin master >&2; then
             echo "✅ Auto-push successful. Re-verifying sync..." >&2
             SERVER_OUTPUT_RECHECK=$(ssh -o BatchMode=yes quick "php quick.robnugen.com/bin/get-next-story-word.php")
             SERVER_HASH_RECHECK=$(echo "$SERVER_OUTPUT_RECHECK" | grep "^HASH:" | cut -d':' -f2)
             SERVER_WORD_RECHECK=$(echo "$SERVER_OUTPUT_RECHECK" | grep "^WORD:" | cut -d':' -f2-)

             LOCAL_HASH_RECHECK=$(git rev-parse HEAD)

             if [ "$LOCAL_HASH_RECHECK" == "$SERVER_HASH_RECHECK" ]; then
                 # Update validation variables for display
                 SERVER_WORD="$SERVER_WORD_RECHECK"
                 # We are now in sync!
                 echo "✅ Sync verified ($LOCAL_HASH_RECHECK)" >&2
             else
                 echo "❌ ERROR: Auto-push appeared successful but hashes still mismatch!" >&2
                 echo "Local:  $LOCAL_HASH_RECHECK" >&2
                 echo "Server: $SERVER_HASH_RECHECK" >&2
                 exit 1
             fi
        else
            echo "❌ ERROR: Auto-push failed." >&2
            exit 1
        fi
    else
        echo "" >&2
        echo "❌ ERROR: Repository synchronization mismatch!" >&2
        echo "Local HEAD:  $LOCAL_HASH" >&2
        echo "Server HEAD: $SERVER_HASH" >&2
        echo "" >&2
        echo "This usually means either:" >&2
        echo "1. You have local commits that haven't been pushed" >&2
        echo "2. The server has issues pulling/pushing" >&2
        echo "" >&2
        echo "Please 'git push' or resolve conflicts before proceeding." >&2
        exit 1
    fi
fi

# 6. Display context to stderr
echo "" >&2
echo "✅ Repositories are in sync ($(git rev-parse HEAD))" >&2
echo "" >&2
echo "Context (Reverse Time):" >&2
echo "-----------------------" >&2

# Print the next word aligned
# Using %s to handle special chars safely
printf "* ........ %s  <---- next word\n" "$SERVER_WORD" >&2

# Print last 9 commits from local log
git log --oneline -9 | while IFS= read -r line; do
    echo "* $line" >&2
done
echo "" >&2

# 7. Output ONLY the word to stdout
printf "%s\n" "$SERVER_WORD"
