---
title: Strange git behavior 
tags: [ "2024", "git", "strange", "quick" ]
author: Rob Nugen
date: 2024-02-04T21:53+09:00
draft: false
---

(written 8:55 Monday 5 February 2024)

Last night I got Quick to save to the correct directory
for my journal entries of that year and month, yay!

A git submodule for my journal entries monitors the directory
but amazingly the files written to `journal/2024/02` don't
appear when I `git status` anywhere in that submodule.

What perplexing behavior.. I look forward to finishing the 
final steps that allow posts through Quick to appear on my journal.

##### 22:21 Monday 05 February 2024 JST

Haha: it was because I had `*` in my `~/.gitignore` file.