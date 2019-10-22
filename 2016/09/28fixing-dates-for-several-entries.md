---
title: fixing dates for several entries
tags: [ "journal" ]
author: Rob Nugen
date: 2016-09-28T13:13:05+09:00
---

## 13:13 Wednesday 28 September 2016 JST

Hugo is picky about the date format.  It's gotta look like this
2016-09-28T13:13:05+09:00 which I'm sure is a named standard, but I
don't know the name.

Right now, after reverting an old commit in which I *removed* a lot of
dates because Middleman couldn't deal with dates after 3pm, I have 245
dates which Hugo cannot parse.

I copied and truncated each line from the list of errors from Hugo's
output, and have 245 lines like these three:

    '2005-09-26 20:08:51' in page ~/journal/2005/09/26themes.md
    '2005-09-26 18:19:56' in page ~/journal/2005/09/26wordpress.md
    '2005-10-14 15:30:09' in page ~/journal/2005/10/14general-relativity-versus-newton.md

Time for some emacs macros to fix them up.

## 13:26

Sweet done!
