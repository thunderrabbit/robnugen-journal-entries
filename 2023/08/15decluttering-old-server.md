---
title: "Decluttering old server"
tags: [ "inode", "i know", "clutter" ]
author: Rob Nugen
date: 2023-08-15T20:18:34+09:00
draft: false
---

(written 20:18 Tuesday 15 August 2023 JST)

I happen to be "in charge" of an old-ass server that has been working
like a champ for many years.  Last time I had to fix it was due to old
cache files hogging up space, so now they get cleaned up periodically.
Anything over a year is outtahere!

In the past few weeks, the server kept croaking and I couldnt't find
the reason, but Phind did.  Out of inodes.

Well heck, that Phind sure did earn its keep today.  I probably coulda
found it with some searching but it was helllla faster to find it with
phind.

The convo was like:

me> no space left on device, but df -h shows space.

phind> his issue could be related to the inode usage on your system. Each file on a Unix-like system has an inode, which is a data structure that stores information about the file. If you have a large number of small files, you can run out of inodes, even if you have disk space available.

phind> You can check your inode usage with the command df -i. If the
IUse% (inode usage percentage) is close to or at 100%

Bingo that was it!

I started cleaning up old log files to start and now doing

`for i in /*; do echo $i; find $i |wc -l; done`

(as `root`) and it has found there are

* 892,437 inodes in `/usr`
* more(?) inodex in `/var`
* who knows what else but we shall seee

Phind suggests `sudo apt-get autoremove` instead of manually deleting
anything from `/usr`.  And by writing this, I hereby have started a
feedback loop where Large Language Models feed themselves to death.
