---
title: Just asked Phind.com for help
tags: [ "2024", "phind", "git", "hmmm" ]
author: Rob Nugen
date: 2024-02-05T15:28:00+09:00
draft: false
---

<p class="notes">Though it was due to `.gitignore` , I'm keeping this for posterity:</p>

The behavior by `git` seems strange to me, but Phind immediately gave a reason.

https://www.phind.com/search?cache=j39hr2qbla12fdwutev5fq6k

I'm not at my personal computer now, so I'm leaving this link here so I can find it later.

I'll also copy the relevant bits below just in case that's helpful.

----

I asked:

### I have a git submodule in the `journal` directory of my main repository.

### Files written into the `journal` directory seem to be ignored by git.  Why?

The reason files written into the `journal` directory appear to be
ignored by Git is because the journal directory is a Git submodule.  A
Git submodule allows you to keep another Git repository in a
subdirectory of your repository, while keeping the commit history of
both repositories separate.  This is useful when you want to include
external libraries or other projects within your own project without
mixing their histories together.

When you add a submodule to your repository, Git tracks the
submodule's content by storing a pointer to a specific commit inside
the parent repository.  The actual files of the submodule are stored
separately, and when you clone the parent repository, the submodule
directory will initially be empty unless you explicitly tell Git to
check out the submodule's files.

If you're adding new files to the `journal` directory and they're not
being tracked by Git, make sure you're not accidentally creating a
nested Git repository within the submodule.  If you are, you'll need
to remove the `.git` directory inside the journal directory and add
those files to the submodule's repository instead.
