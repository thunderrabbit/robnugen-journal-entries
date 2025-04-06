---
title: "AI ain't quite taken my job yet."
tags: [ "2025", "ai", "code", "helpful" ]
author: Rob Nugen
date: 2025-04-06T10:34:00+09:00
draft: false
---

I signed up for Plandex $10 trial at https://plandex.ai/

I tried the free trial, but I'd have to pay openrouter separately, so I just did the $10 trial to see if Plandex will do the things I hope.

I had to wipe my plandex keys to get from free to paid:


    thunderrabbit@pop-os:~$ rm -rf ~/.plandex-home-v2
    thunderrabbit@pop-os:~$ rm -rf .plandex-v2


Version 2 is clearly superior to version 1.  I gave it a complex query and it responded perfectly well.

In my local Quick directory:

 💬 User prompt 👇 

<p class="note">Can you allow entries to be saved to disk without immediately committing them in their git repo?  Then add a separate button near the Deploy button to allow committing entries.</p>

 🤖 Plandex reply 👇 

<p class="ai">I'll help you implement a feature to save entries to disk without
immediately committing them to git, and add a separate commit button. Let me
look at the relevant files to understand how the current posting and
deployment system works.</p>

<p class="ai">Looking at your codebase, I can see that you have a journal posting system
with classes like  QuickPoster  for creating posts and  TempOSpooner  for
git operations. Currently, when a post is created, it seems to be
automatically committed to git. You also have a deployment mechanism.</p>

<p class="ai">Let's examine the specific files that handle posting and git operations to
understand how to modify them.</p>

<p class="ai">### Categories</p>

<p class="ai">Posting System
Git Operations
UI Components</p>

<p class="ai">### Files</p>

<p class="ai">classes/QuickPoster.php , createPost, createFrontMatter, createFilePath,createUrlTitle
<br>classes/TempOSpooner.php , addFileToGit, commitChanges,
pushChangesToCurrentBranch, addAndPushToGit, getGitLog
<br>public/poster/index.php , (main posting interface)
<br>templates/poster/index.tpl.php , (posting form template)
<br>public/deploy/index.php , (deployment interface)
<br>classes/QuickDeployer.php , deployMasterBranch</p>

<p class="ai">Loaded 6 files into context | added → 5476 🪙 |  total → 7640 🪙</p>

<p class="ai">
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
</p>

<p class="ai">👇</p>

<p class="ai">I understand you want to modify your system to separate the saving of
entries from the git commit process, and add a dedicated commit button.
Let's analyze how this would work with your current codebase.</p>

<p class="ai">## Current Flow Analysis</p>

<p class="ai">Looking at your code, here's how the posting process currently works:</p>

<p class="ai">1. In  public/poster/index.php , when a form is submitted:
  • A  QuickPoster  instance creates and saves the post to disk
  • Then a  TempOSpooner  instance immediately adds, commits, and pushes the
  file to git
2. The git operations happen in  TempOSpooner::addAndPushToGit() , which
calls:
  •  addFileToGit()
  •  commitChanges()
  •  pushChangesToCurrentBranch()
3. The "Deploy" button in the UI calls a separate process that runs a
deployment script.</p>

<p class="ai">## Proposed Changes</p>

<p class="ai">To implement your request, we would need to:</p>

<p class="ai">1. Modify the posting process to save files without committing them
2. Add a new "Commit Changes" button to the UI
3. Create a new endpoint/handler for the commit action</p>

<p class="ai">Here's how we could approach this:</p>

<p class="ai">### 1. Modify the Posting Process</p>

<p class="ai">In  public/poster/index.php , we would need to modify the post-submission
logic to only save the file without committing it. This means we would:</p>

<p class="ai">• Keep using  QuickPoster  to save the file to disk
• Skip the  TempOSpooner::addAndPushToGit()  call that currently happens
automatically</p>

<p class="ai">### 2. Add a "Commit Changes" Button</p>

<p class="ai">In  templates/poster/index.tpl.php , we would add a new button near the
existing "Deploy" button. This would be a form that submits to a new
endpoint for committing changes.</p>

<p class="ai">### 3. Create a Commit Handler</p>

<p class="ai">We would need to create a new endpoint (like  /commit/index.php ) that
would:</p>

<p class="ai">• Use  TempOSpooner  to add, commit, and push any uncommitted files
• Return to the poster page with a success message</p>

<p class="ai">## Tracking Uncommitted Files</p>

<p class="ai">One challenge is tracking which files need to be committed. There are a few
approaches:</p>

<p class="ai">1. Git Status Approach: Use  git status  to identify uncommitted files
2. Database Tracking: Keep a record of uncommitted files in a database
3. Session Tracking: Track uncommitted files in the session</p>

<p class="ai">The simplest approach would be to use git's own status command to identify
uncommitted files, then commit all of them when the user clicks the "Commit
Changes" button.</p>

<p class="ai">## Implementation Considerations</p>

<p class="ai">• You'll need to decide if you want to commit all uncommitted files at once
or allow selective commits
• You might want to display a list of uncommitted files to the user
• Error handling should be robust to handle git operation failures</p>

<p class="ai">Would you like me to go into more detail on any specific part of this
implementation? If you're ready to proceed with implementing these changes,
we can switch to tell mode to start making the necessary modifications to
your files.</p>


Wow that's a lot!  And it looks great!  But I wanted to take things step by step.  I know part of its selling points include handling multi-step processes, but given that it's my first time to play with it, I asked it to just do the first part.

 💬 User prompt 👇 

<p class="note">First please just add a way to see the output of `git status` or something like "All changes committed."</p>


I did the first step first, but then just rolled on through the steps.

On the plus side, it has an easy interface for looking over the changes, much like a code review.  I saw that it killed the most important bit of code and replaced it with boilerplate.  Hmmm better fix that.

 💬 User prompt 👇 

<p class="note">Okay, I didn't explain this, but in public/poster/index.php the NextStoryWord is
literally the most important part of the git commit.  This is the commit message
and one hundred percent aabsolutely MUST be used to determine what git message
to use.  The reason is complex, and I'm happy to explain it after you restore
the NextStoryWord code and use it to determine the git message.</p>

 🤖 Plandex reply 👇 

<p class="ai">I understand that I need to restore the NextStoryWord functionality in the git commit process. This is a critical component that was removed during our modifications to separate saving from committing. The NextStoryWord class appears to be used to generate commit messages, and according to you, it's absolutely essential to the system.</p>

<p class="ai">Looking at the codebase, I need to examine how NextStoryWord was previously used in the poster/index.php file and then restore this functionality in our new commit process. I'll need to look at the NextStoryWord class implementation and how it was integrated with the git commit process before our changes.</p>                    

etc etc and it fixed it!  +1 for Plandex!

But I noticed another issue.  It kept putting in a `commit_message` field in the Commit `form`.  Of course, this is because all commit forms need a commit message field!   Except for mine.

Kids, (as of 6 April 2025,) AI does not actually think for itself.  It's just repeating back what it sees and there are dang few examples of git commit forms without git commit messages.

So I went ahead and committed the changes and found more issues:

These include:

* unclosed HTML tag
* double-closed PHP endif
