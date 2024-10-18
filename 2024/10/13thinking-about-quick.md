---
title: "thinking about Quick"
tags: [ "2024", "quick" ]
author: Rob Nugen
date: 2024-10-13T23:43:00+09:00
draft: false
---

[Quick](https://github.com/thunderrabbit/quick) is my replacement for
[Quill](https://github.com/aaronpk/Quill/),
which, last I checked, wasn't updated (*) to PHP 8, though my servers have been.

I wasn't using much of Quill's features,
so I just slapped together a thing to save journal entries via a web form.

However, there are some bonus features I'm building into Quick,
which make the whole setup a Frankenstein extravaganza.
Details, for the curious 🧐:

The files are saved to a `journal/yyyy/mm/` directory structure
which nestles nicely into my Hugo-driven static website.
This journal directory is tracked by my git repo in which
I've been writing a story backwards in the commit messages,
one word at a time.

Because I want to manually confirm each word in the backwards story is correct,
I only commit them manually, on my local laptop (currently my System76 Lemur).
Because they are saved by Quick on a remote server,
I need a reliable way to get just the files from the server to my local machine.

For the past couple (?) of years, until two days ago,
I was using `scp` to get the files which hadn't been added to the git repo.
However, in order to store them locally in the correct location,
I need to SCP them one at a time.
That causes the remote server to get mad 😡 and
block SCP connections after about four files
(I was doing one connection to get the list of files, then for each file,
one connection to copy it locally, and then
a second connection to move it out of that remote directory
so it wouldn't
(a) be copied again, and
(b) cause problems with git
(when that repo is updated with the same named files
in a locally manually created git commit)).

Three(?) days ago I tried using rsync, but couldn't get it to just get the few files.

A couple days ago, I realized I can use git, so now, my basic setup is:

* save files on remote server (already done years ago)
* commit files to a new temporary branch on remote server
* push temporary branch to remote
* delete old temp branch on server and remote
* locally get new temporary branch
* `git merge --squash` temporary branch
* manually check next word in backwards story
* commit new word with any changes as needed

Yesterday (as I write this while with Quick while on the train with Jess to Nagano) when the power cut off at the airport, I was using `plandex` to make updates to the code:

* Check if master branch is ahead of temporary branch
* If so, delete the old temp branch on server and remote

Next plans are to wrap these commands in functions to make the code more legible,
less verbose, and slightly more beautiful.

(*) Quill was updated in the last month,
but the recent commit messages don't look like they address PHP 8 issues.
https://github.com/aaronpk/Quill/commit/8ecaed3d2f5a19bf1a5c4cb077658e1bd3bc8438
