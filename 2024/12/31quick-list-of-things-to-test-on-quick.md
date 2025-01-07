---
title: "Quick list of things to test on Quick"
tags: [ "2024", "" ]
author: Rob Nugen
date: 2024-12-31T18:08:00+09:00
draft: false
---

There are basically this many steps to posting things with Quick:

1. Post an entry using Quick (which will create a `temp_xxx` branch and push that to remote `origin`)
2. Get that branch locally
3. Manually fix up the commit messages onto branch `master`
4. Push `master` branch to `origin`
5. Quick deals with testing branch dates to select appropriate branch

`1` can be done multiple times in a row.

Expected behavior: use same `temp_xxx` branch if it's newer than `master`.

`2` and `3` must be done in that order (because I want to monitor the story progression)

### 18:23 Tuesday 7 January 2025

Actually now I've gotten https://github.com/thunderrabbit/Quick working pretty reliably,
so I think I'm gonna try to have it determine the next word to use as the commit message.
I'll still have it commit to the `temp_xxx` branch so I can verify I like its choice.
