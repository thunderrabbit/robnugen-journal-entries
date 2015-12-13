---
title: reasons 8,148 and 8,149 to hate Apple
tags: disk
author: Rob Nugen
date: 2015-12-12T08:06:15+09:00
---

## 08:06 Saturday 12 December 2015 JST

Tariq was able to partition my disk, and I was able to encrypt it.

But, for some unexplicable reason, the name of *one* of the drives I
encrypted is now mounted as Name1 instead of just Name, as I specified.

AND, two of the three drives routinely cannot be ejected.

This had been a problem long enough to tick off my man Luis
back in April 2014: [The Disk Wasn’t Ejected Because We’re Stupid](http://blogd.com/wp/index.php/archives/10750)

I tried doing
[`lsof +D /Volumes/Name`](https://www.reddit.com/r/mac/comments/3qsxuw/disk_x_wasnt_ejected_because_one_or_more_programs/cwi2sfv)
for both affected drives, and in both cases got errors about files
that were unreadable (due to file permissions).

Well if they're unreadable, what the hell is reading them and why
can't you let me know what's reading them more precisely than "one or
more programs may be using it" ???

