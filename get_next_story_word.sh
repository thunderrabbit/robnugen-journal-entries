#!/bin/bash

# /home/thunderrabbit/work/rob/robnugen.com/journal/journal/get_next_story_word.sh
#
# Asks the server decider for the next story STEP and executes it locally,
# keeping master as the tip (deploy-safe):
#   COMMIT  -> git commit -m WORD                       (linear, the daily case)
#   OPEN    -> git branch hold/CHILD master ; commit    (begin a nested story)
#   CLOSE   -> commit-tree merge of nested tip onto held base ; word rides the merge
#   DONE    -> story complete, nothing to commit
# hold/* refs are LOCAL bookmarks (never pushed); master carries everything.
#
# --dry-run : fully local & read-only — runs the local decider against the local
#             story + repo (no SSH, no pulls, no commits, no pushes) and prints
#             the step it WOULD execute.

DRY_RUN=0
[ "$1" == "--dry-run" ] && DRY_RUN=1

cd "$(dirname "$0")"
REPO="$(pwd)"

# ----------------------------------------------------------------------------
# DRY RUN: local decider, read-only. Proves the next action without any writes.
# ----------------------------------------------------------------------------
if [ "$DRY_RUN" -eq 1 ]; then
    QUICK_LOCAL="${QUICK_LOCAL:-$HOME/work/rob/quick.robnugen.com}"
    STORY_LOCAL="${STORY_LOCAL:-$HOME/x0x0x0/x0x0x0.txt}"
    echo "DRY RUN (read-only) — local decider against:" >&2
    echo "  story: $STORY_LOCAL" >&2
    echo "  repo : $REPO" >&2
    OUT=$(php "$QUICK_LOCAL/bin/get-next-story-word.php" --dry-run --story="$STORY_LOCAL" --repo="$REPO") \
        || { echo "decider failed:" >&2; echo "$OUT" >&2; exit 1; }
    echo "--- decider output ---" >&2
    echo "$OUT" >&2
    ACTION=$(printf '%s\n' "$OUT" | sed -n 's/^ACTION://p')
    WORD=$(printf  '%s\n' "$OUT" | sed -n 's/^WORD://p')
    CHILD=$(printf '%s\n' "$OUT" | sed -n 's/^CHILD://p')
    echo "--- would execute ---" >&2
    case "$ACTION" in
        COMMIT) printf '  git commit -m %q\n' "$WORD" >&2 ;;
        OPEN)   printf '  git branch hold/%s master\n  git commit -m %q\n' "$CHILD" "$WORD" >&2 ;;
        CLOSE)  printf '  base=$(git rev-parse hold/%s); tip=$(git rev-parse master)\n' "$CHILD" >&2
                printf '  git add -A; tree=$(git write-tree)\n' >&2
                printf '  M=$(git commit-tree $tree -p $base -p $tip -m %q)\n' "$WORD" >&2
                printf '  git update-ref refs/heads/master $M; git branch -D hold/%s\n' "$CHILD" >&2 ;;
        DONE)   echo "  (story complete — nothing to commit)" >&2 ;;
        *)      echo "  ?? unknown ACTION: '$ACTION'" >&2; exit 1 ;;
    esac
    exit 0
fi

# ----------------------------------------------------------------------------
# NORMAL PATH (SSH to server decider, then execute on the live journal)
# ----------------------------------------------------------------------------
set -e

# 1. Sync local repository
echo "Syncing local repository..." >&2
git pull -q >&2 || echo "Warning: Local git pull failed or timed out" >&2

# 2. Call server decider
echo "Retrieving next story step from quick.robnugen.com..." >&2
SERVER_OUTPUT=$(ssh -o BatchMode=yes quick "php quick.robnugen.com/bin/get-next-story-word.php")
SSH_EXIT=$?

if [ $SSH_EXIT -ne 0 ]; then
    echo "" >&2
    echo "Error: Failed to connect to server or execute script." >&2
    echo "The SSH key probably needs unlocking. Run:" >&2
    echo "" >&2
    echo "  ssh-add ~/.ssh/barefoot_rob_dh" >&2
    echo "" >&2
    echo "Enter the passphrase, then try this script again." >&2
    exit 1
fi

# 3. Parse output
parse_field() { printf '%s\n' "$1" | sed -n "s/^$2://p"; }
SERVER_HASH=$(parse_field "$SERVER_OUTPUT" HASH)
SERVER_ACTION=$(parse_field "$SERVER_OUTPUT" ACTION)
SERVER_WORD=$(parse_field "$SERVER_OUTPUT" WORD)
SERVER_CHILD=$(parse_field "$SERVER_OUTPUT" CHILD)

if [ -z "$SERVER_HASH" ]; then
    echo "Error: Server response did not contain a valid git hash." >&2
    echo "Raw Output:" >&2
    echo "$SERVER_OUTPUT" >&2
    exit 1
fi

# 4. Sync local repository again (catch any pushes from server)
echo "Syncing local repository with server changes..." >&2
git pull -q >&2 || echo "Warning: Local git pull failed or timed out" >&2

# 5. Compare hashes; auto-push if local is strictly ahead (fast-forward)
LOCAL_HASH=$(git rev-parse HEAD)

if [ "$LOCAL_HASH" != "$SERVER_HASH" ]; then
    LOCAL_HEAD_MSG=$(git log -1 --pretty=format:'%s')

    # Local ahead by a fast-forward (works for linear commits AND close-merges,
    # whose first parent is the held base rather than the previous tip) and the
    # unpushed commit's message is the word the server still expects next.
    if git merge-base --is-ancestor "$SERVER_HASH" "$LOCAL_HASH" && [ "$LOCAL_HEAD_MSG" == "$SERVER_WORD" ]; then
        echo "" >&2
        echo "😎 Local is fast-forward ahead and HEAD message matches the next story word." >&2
        echo "   Message: '$LOCAL_HEAD_MSG'  Action: auto-push to sync..." >&2

        if git push origin master >&2; then
             echo "✅ Auto-push successful. Re-verifying sync..." >&2
             SERVER_OUTPUT_RECHECK=$(ssh -o BatchMode=yes quick "php quick.robnugen.com/bin/get-next-story-word.php")
             SERVER_HASH_RECHECK=$(parse_field "$SERVER_OUTPUT_RECHECK" HASH)
             # refresh the step from the now-synced server
             SERVER_ACTION=$(parse_field "$SERVER_OUTPUT_RECHECK" ACTION)
             SERVER_WORD=$(parse_field "$SERVER_OUTPUT_RECHECK" WORD)
             SERVER_CHILD=$(parse_field "$SERVER_OUTPUT_RECHECK" CHILD)

             LOCAL_HASH_RECHECK=$(git rev-parse HEAD)
             if [ "$LOCAL_HASH_RECHECK" == "$SERVER_HASH_RECHECK" ]; then
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
        echo "Either you have local commits that aren't fast-forward, or the server" >&2
        echo "could not pull/push. Resolve before proceeding." >&2
        exit 1
    fi
fi

# 6. Display context to stderr
echo "" >&2
echo "✅ Repositories are in sync ($(git rev-parse HEAD))" >&2
echo "" >&2
echo "Next step: $SERVER_ACTION ${SERVER_CHILD:+($SERVER_CHILD)}" >&2
echo "Context (Reverse Time):" >&2
echo "-----------------------" >&2
printf "* ........ %s  <---- next word (%s)\n" "$SERVER_WORD" "$SERVER_ACTION" >&2
git log --oneline -9 | while IFS= read -r line; do echo "* $line" >&2; done
echo "" >&2

# 7. Execute the step (only when there are staged changes to carry)
if [ "$SERVER_ACTION" == "DONE" ]; then
    echo "🏁 Story complete — no further words." >&2
elif git diff --cached --quiet; then
    echo "ℹ️ No staged changes detected. Skipping ($SERVER_ACTION)." >&2
else
    case "$SERVER_ACTION" in
        COMMIT)
            git commit -m "$SERVER_WORD" >&2 && echo "✅ Commit: $SERVER_WORD" >&2
            ;;
        OPEN)   # leave a held pointer at the dive-base, then commit on master
            git branch "hold/$SERVER_CHILD" master >&2
            git commit -m "$SERVER_WORD" >&2 && echo "✅ OPEN $SERVER_CHILD: $SERVER_WORD" >&2
            ;;
        CLOSE)  # re-route master's first parent to the held base; merge nested tip
            BASE=$(git rev-parse "hold/$SERVER_CHILD") \
                || { echo "❌ CLOSE: hold/$SERVER_CHILD missing" >&2; exit 1; }
            TIP=$(git rev-parse master)
            git add -A
            TREE=$(git write-tree)
            MERGE=$(git commit-tree "$TREE" -p "$BASE" -p "$TIP" -m "$SERVER_WORD")
            git update-ref refs/heads/master "$MERGE"
            git branch -D "hold/$SERVER_CHILD" >&2
            echo "✅ CLOSE $SERVER_CHILD: $SERVER_WORD (merge $MERGE)" >&2
            ;;
        *)
            echo "❌ Unknown action from server: '$SERVER_ACTION'" >&2
            exit 1
            ;;
    esac
fi

# 8. Output ONLY the word to stdout
printf "%s\n" "$SERVER_WORD"
