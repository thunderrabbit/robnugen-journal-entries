---
title: Reason 8,149 to hate apple
tags: xcode
author: Rob Nugen
date: 2015-12-16T16:23:44+09:00
---

## 16:23 Wednesday 16 December 2015 JST

OKay so I have a lot of audio files in XCode for the project we're
making.  They are recordings of words for pronunciation practice.

I needed to add some more files for "similar words," two of which
ended up being the same words as the original words.

XCode lets me drag files in from Finder and index them into the
project.  So I dragged in 120 files andddd I get an amazing error
message like, "one or more errors occurred while importing files"

Okay, so the files weren't imported.  I'll just import the correct
ones, right?  Wrong!!

Though the files were not *index*, they were spammed into the
directory of the project, and XCode doesn't know about them!  They're
not visible in XCode so imagine the joy of dragging in a file that
doesn't exist in XCode but *does* exist in the underlying directory!

This has been a problem for years and still isn't fixed.  Emacs can
deal with it; Sublime can deal with it; Netbeans can deal with
it.. and those are just the ones I know because I've used them!  Why
can't Apple's own product deal with Apple's own file system?
