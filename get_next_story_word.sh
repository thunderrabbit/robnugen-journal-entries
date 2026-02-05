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

# 6. Display context to stderr
echo "" >&2
echo "✅ Repositories are in sync ($LOCAL_HASH)" >&2
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
