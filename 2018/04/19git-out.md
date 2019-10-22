---
title: "git out"
tags: [ "git", "fossil", "oops" ]
author: Rob Nugen
date: 2018-04-19T00:15:53+09:00
---

## 00:15 Thursday 19 April 2018 JST

* 39c7bfa recent entries
* 17a339c removed : from titles
* 70ec6d3 TEMPoRARY commit, not including all years, and not cleaned up filenames
* 6086901 Added README
* 354c77e (bitbucket/master) p
* 1fbcd35 s
* c385ebb colon
* 492f2fc slash
* 3b91dec slash
* 40ba10c w
* ce5271f w
* 8be74d2 w
* afebd29 dot

The above shows a weird thing that happened to my git repo while I was messing with Fossil.  The commit 6086901 is the first, and the commit 354c77e is the last, but it was shown right in a row.

* 009ce03 (HEAD -> master, bitbucket/master)
* 423fc12 Uh,
* 0844b6a yeah,
* 86a5a58 uhh..
* 69409ec h
* b961113 t
* 054caad t
* 1201bc1 p
* 7cfcb9a s
* 0cdde35 colon
* 4e4a200 slash
* 3838c9e slash
* 82b58ce w
* 481d694 w
* d77032a w
* 6dd65ea dot

This is the current top of the commit. Turns out the weird append was due to two different branches having identical, but non-related histories.

I `git push --force` to break it and fix it again.  Not sure if I went
with the original history or a new one.

## 00:25 Sunday 22 April 2018 JST

I wrote the comments above to fix the layout of the commits.

For some reason when I `fossil push` it says wrong project, and it pushes the project properly.
