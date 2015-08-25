---
title: Side effects
tags: codin
author: Rob Nugen
date: 2015-08-25T18:43:05+09:00
---

## 18:43 Tuesday 25 August 2015 JST

There were <del>two</del> <ins>multiple</ins> side effects that caused
a problem with the live AB server the other day.

I wrote some code, tested it and found it working perfectly.

Added another function call above that code and tested it.  Also
worked perfectly.

Testing complete!  Ship it!

Fortunately, I had asked the client to call me before she ran the code
the first time.  I checked the output and ... hmmm half of the changes
didn't get made.

It turns out that the first-tested code was skipped because the code
above it used the same date-counter to keep track of its biznass.
Oops so the second code detected all its run had been run, when
actually none of them had.

So, how many side effects?

1. not testing properly
2. literal side effect

Nope!

One! The one that comes from not using Hakyll!
