---
title: "Writing from my new Lemur"
tags: [ "lemur", "system76", "journal", "barrier" ]
author: Rob Nugen
date: 2020-12-21T13:08:24+09:00
draft: false
---

Okay yay!  A couple days ago I received my new System76 laptop running
Pop!_OS.

1. The first day, I installed a few things including Dragonframe, and
copied all my Marble Track 3 data for Dragonframe.  Also got signed in
to https://chat.pop-os.org/ and have received help from some peeps,
notably @derpmatt, @datapoke, and @mmstick
2. The second day, I cloned a copy of my hugo website and journal
entries, then while researching Virtualbox replacements, I discovered
[Barrier](https://github.com/debauchee/barrier/) and got it installed
on old machine and new machine so I can use my same keyboard and mouse
and smoothly control both machines.  So nice!
3. Today I started to dig into my BASH and Emacs configurations. So
far, I have gotten to the point that I can type `C-c j` to (start the
macro that accepts title, N tags, and optional date so I can) create
journal entries.

#### 15:39

I think I was able to upload the entries from here.  I had to create a
specific entry in `.ssh/config` for Github, similar to what I did for
Bitbucket.

```
#ssh bitbucket with specific key
Host sbucket
    Hostname bitbucket.org
    IdentityFile ~/.ssh/lemur-bitbucket-20dec2020
    IdentitiesOnly yes

#ssh github with specific key
Host sgithub
    Hostname github.com
    IdentityFile ~/.ssh/lemur-bitbucket-20dec2020
    IdentitiesOnly yes
```

And then I updated the `.git/config` lines to use `sbucket` and `sgithub` as needed, e.g.

```
[remote "origin"]
	url = git@sbucket:thunderrabbit/robnugen-journal-entries.git
	fetch = +refs/heads/*:refs/remotes/origin/*
```
