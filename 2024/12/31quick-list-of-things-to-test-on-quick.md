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

1 can be done multiple times in a row.

Expected behavior: use same `temp_xxx` branch if i

2 and 3 must be done in that order (because I want to monitor the story progression)