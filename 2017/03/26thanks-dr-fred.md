---
title: thanks Dr Fred!
tags: work
author: Rob Nugen
date: 2017-03-26T22:23:16+09:00
---

## 22:23 Sunday 26 March 2017 JST

Talked with Fred today for 6+ hours working on a backup script.  When
I tried to run it on all the tables, the resulting .tar.gz file was
like 8GB and was hanging the machine when I tried to work with it.

So I split the archive by years and got Fred to help me write a bash
script to loop through the years of the data and bundle the tables up
into more useably sized archives.

He saved me a ton of time, got the script much more compact than I
could have or would have, and made it more secure by getting the
keys out of it.  (Now they are read from config files.)  I ran it on
the live server and killed all the disk space for a second, but then
cleared it up and it ran okay.  9GB across about 20 different files.

Next: analytics
