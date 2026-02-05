---
title: "Richness in my life"
tags: [ "2026", "aiandi" ]
author: Rob Nugen
date: 2026-02-05T16:55:00+09:00
draft: false
---

Today AI and I added functionality to my journaling system so I can easily keep the backwards story ongoing.


::: ai gemini

# Next Story Word SSH Automation Walkthrough

This document outlines the solution implemented to automate retrieving the "Next Story Word" from the story for use in git commit messages, ensuring the continuity of the backwards-storytelling art project.

## Components

### 1. Server-Side Script
**Name:** `get-next-story-word.php`
**Function:**
- Pulls latest changes from git
- Pushes any local server changes
- Returns current Git Hash and Next Story Word

### 2. Local Helper Script
**Name:** `get_next_story_word.sh`
**Function:**
- Syncs local repository (`git pull`)
- Connects to server via SSH to run the script
- Verifies repository synchronization (hashes must match)
- **Auto-Push Logic:** If local repo is 1 commit ahead AND the message matches the next word, it automatically pushes (displaying 😎)
- Outputs only the next word to stdout for capture
- Prints context (recent commits) to stderr for user verification

## Usage

```bash
# Retrieve next word into variable
NEXT_WORD=$(./get_next_story_word.sh)

# Commit with it
git commit -m "$NEXT_WORD"
```

## Verification Results

The following workflow was verified:
1. **Repository Sync**: Correctly detects when out of sync.
2. **Special Characters**: Verified handling of quotes and punctuation.
3. **Auto-Push**:
   - Detected local commit "richness" was unpushed.
   - Matched it with server's expected next word.
   - Displayed: `😎 Local repository is 1 commit ahead...`
   - Automatically pushed to server.
   - Retrieved following word: "and".

## Current State
- **Local Repo**: Synced with server
- **Server Repo**: Synced with local
- **Next Word**: "and"
- **Continuity**: "... and richness into my life. Like just recently..."

:::
