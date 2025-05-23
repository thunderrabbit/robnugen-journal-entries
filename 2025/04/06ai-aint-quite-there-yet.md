---
title: "AI ain't quite there yet"
tags: [ "2025", "ai", "plandex", "v2", "ugh", "quick" ]
author: Rob Nugen
date: 2025-04-06T11:06:00+09:00
draft: false
---

<p class="note">This is a near-duplicate of the previous entry because I thought I lost the previous one.  I'm keeping both because part of the fix is to see if I can commit two files at once with my Quick interface.</p>

I signed up for a free Plandex V2 trial, but couldn't get it to do even the smallest thing without sending some monies to OpenRouter, so I just signed up for Plandex V2 $10 trial, which includes $10 in credits which never expire.   I had to wipe my plandex keys to go from the free plan to the paid plan:


    thunderrabbit@pop-os:~$ rm -rf ~/.plandex-home-v2
    thunderrabbit@pop-os:~$ rm -rf .plandex-v2

Once that was working, my first message to Plandex was in my Quick directory:

 💬 User prompt 👇

<p class="note">Can you allow entries to be saved to disk without immediately committing them in
their git repo?  Then add a separate button near the Deploy button to allow
committing entries.</p>

 🤖 Plandex reply 👇

::: ai plandex

I'll help you implement a feature to save entries to disk without
immediately committing them to git, and add a separate commit button. Let me
look at the relevant files to understand how the current posting and
deployment system works.

Looking at your codebase, I can see that you have a journal posting system
with classes like  QuickPoster  for creating posts and  TempOSpooner  for
git operations. Currently, when a post is created, it seems to be
automatically committed to git. You also have a deployment mechanism.

Let's examine the specific files that handle posting and git operations to
understand how to modify them.

### Categories

Posting System
Git Operations
UI Components

### Files


<br>classes/QuickPoster.php , createPost, createFrontMatter, createFilePath,createUrlTitle
<br>classes/TempOSpooner.php , addFileToGit, commitChanges,
pushChangesToCurrentBranch, addAndPushToGit, getGitLog
<br>public/poster/index.php , (main posting interface)
<br>templates/poster/index.tpl.php , (posting form template)
<br>public/deploy/index.php , (deployment interface)
<br>classes/QuickDeployer.php , deployMasterBranch


Loaded 6 files into context | added → 5476 🪙 |  total → 7640 🪙

<pre>
+------------------------------------+------+-------+
|                NAME                | TYPE |  🪙   |
+------------------------------------+------+-------+
|  📄 classes/QuickPoster.php        | file | +1104 |
|  📄 public/deploy/index.php        | file | +223  |
|  📄 classes/QuickDeployer.php      | file | +197  |
|  📄 public/poster/index.php        | file | +952  |
|  📄 templates/poster/index.tpl.php | file | +1722 |
|  📄 classes/TempOSpooner.php       | file | +1278 |
+------------------------------------+------+-------+
</pre>

👇

I understand you want to modify your system to separate the saving of
entries from the git commit process, and add a dedicated commit button.
Let's analyze how this would work with your current codebase.

## Current Flow Analysis

Looking at your code, here's how the posting process currently works:

1. In  public/poster/index.php , when a form is submitted:
    A  QuickPoster  instance creates and saves the post to disk
    Then a  TempOSpooner  instance immediately adds, commits, and pushes the
    le to git
2. The git operations happen in  TempOSpooner::addAndPushToGit() , which
calls:
     addFileToGit()
     commitChanges()
     pushChangesToCurrentBranch()
3. The "Deploy" button in the UI calls a separate process that runs a
deployment script.

## Proposed Changes

To implement your request, we would need to:

1. Modify the posting process to save files without committing them
2. Add a new "Commit Changes" button to the UI
3. Create a new endpoint/handler for the commit action

Here's how we could approach this:

### 1. Modify the Posting Process

In  public/poster/index.php , we would need to modify the post-submission
logic to only save the file without committing it. This means we would:

• Keep using  QuickPoster  to save the file to disk
• Skip the  TempOSpooner::addAndPushToGit()  call that currently happens
automatically

### 2. Add a "Commit Changes" Button

In  templates/poster/index.tpl.php , we would add a new button near the
existing "Deploy" button. This would be a form that submits to a new
endpoint for committing changes.

### 3. Create a Commit Handler

We would need to create a new endpoint (like  /commit/index.php ) that
would:

• Use  TempOSpooner  to add, commit, and push any uncommitted files
• Return to the poster page with a success message

## Tracking Uncommitted Files

One challenge is tracking which files need to be committed. There are a few
approaches:

1. Git Status Approach: Use  git status  to identify uncommitted files
2. Database Tracking: Keep a record of uncommitted files in a database
3. Session Tracking: Track uncommitted files in the session

The simplest approach would be to use git's own status command to identify
uncommitted files, then commit all of them when the user clicks the "Commit
Changes" button.

## Implementation Considerations

• You'll need to decide if you want to commit all uncommitted files at once
or allow selective commits
• You might want to display a list of uncommitted files to the user
• Error handling should be robust to handle git operation failures

Would you like me to go into more detail on any specific part of this
implementation? If you're ready to proceed with implementing these changes,
we can switch to tell mode to start making the necessary modifications to
your files.

:::

That looks amazing!  But because it was my first time to play with Plandex V2, I wanted to go slowly.

 💬 User prompt 👇

<p class="note">First please just add a way to see the output of `git status` or something like "All changes committed."

 🤖 Plandex reply 👇

::: ai plandex

I'll implement a way to display the git status or show "All changes
committed" message in your journal system. This is a good first step before
implementing the full separation of saving and committing functionality.

Looking at your codebase, I need to:

1. Add a method to the TempOSpooner class to get the git status
2. Display this status in the UI, likely on the poster page

The TempOSpooner class already handles git operations, so it's the natural
place to add a method to check git status. Then we'll need to modify the UI
template to display this information.

:::

But it kept going and going, making all the changes based on my original prompt.  One of Plandex selling points is its ability to do multi-step changes!  I think V1 would have committed the steps in separate commits.

Good news: Plandex V2 automatically gets files into its context, basically its knowledge for the chat and changes.

Other good news: Like V1, Plandex V2 offers an easy way to see the proposed changes. Looking through them, I noticed a big issue:

 💬 User prompt 👇

<p class="note">Okay, I didn't explain this, but in public/poster/index.php the NextStoryWord is
literally the most important part of the git commit.  This is the commit message
and one hundred percent aabsolutely MUST be used to determine what git message
to use.  The reason is complex, and I'm happy to explain it after you restore
the NextStoryWord code and use it to determine the git message.</p>

 🤖 Plandex reply 👇

::: ai plandex

I understand that I need to restore the NextStoryWord functionality in the
git commit process. This is a critical component that was removed during our
modifications to separate saving from committing. The NextStoryWord class
appears to be used to generate commit messages, and according to you, it's
absolutely essential to the system.

Looking at the codebase, I need to examine how NextStoryWord was previously
used in the poster/index.php file and then restore this functionality in our
new commit process. I'll need to look at the NextStoryWord class
implementation and how it was integrated with the git commit process before
our changes.

:::

And it worked!  It fixed up the code in a way that looks reasonable, I noticed a couple minor issues:

💬 User prompt 👇

<p class="note">This is closer; thank you.  In the form requesting commit, do not include a
`commit_message` field in the form.  It's not needed.  Just the Commit button
and the system will rely on NextStoryWord to choose the correct message.   Also,
I noticed you used -31 for NextStoryWord but -15 is more than sufficient.  Please
use -15</p>

 🤖 Plandex reply 👇

::: ai plandex

I'll make the requested changes to simplify the commit form by removing the
commit message field and update the NextStoryWord git log parameter from -31
to -15. These changes will streamline the commit process to rely solely on
the NextStoryWord system for generating commit messages.

The changes will need to be made in two files:

1. The commit endpoint file to update the NextStoryWord parameter
2. The poster template file to remove the commit message field and its
explanation

:::

It fixed the issue with `-15` instead of `-31` but I couldn't get it to remove the `commit_message` field from the form, even after three tries..

Kids, (as of 6 April 2025), AI does *not* know what it's doing.  It just repeats back stuff and there are dang few examples of Git Commit forms without commit messages.

So I went ahead and had it apply the changes; I can remove that field easily enough.

Oh, and then more errors became apparent.  So far:

* unclosed HTML div tag
* double-closed PHP endif
* an extra empty line above php open tag on a php file
* * this caused Warning: session_start(): Session cannot be started after headers have already been sent
* ~~FILES ARE NOT BEING SAVED WHATSOEVER~~
* editor isn't able to see the incoming file
* tried calling private methods without making them public

<p class="note">10:16am Ugh I just lost an entry because I thought it had been written to disk.

#### 10:36am

I just recreated the entry (in 20 minutes), so not too bad.

TODO:

* ️✅ learn that the file was saved, just couldn't be edited smh
* ️✅ save this file in my journal via ~~Emacs~~ Quick
* ️✅ apply my fixes so far to Plandex
* ️✅ fix ~~or revert~~ Plandex changes https://github.com/thunderrabbit/Quick/commit/d375f4183de775b26333e820fc3b7c5b63b88ed3
