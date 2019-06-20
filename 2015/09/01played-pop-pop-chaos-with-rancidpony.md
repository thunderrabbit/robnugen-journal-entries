---
title: Played Pop Pop Chaos with rancidpony
tags: [ "bug" ]
author: Rob Nugen
date: 2015-09-01T18:29:52+09:00
---

## 18:29 Tuesday 01 September 2015 JST

A couple days ago I noted someone burst a bubble on
[Pop Pop Chaos](http://www.poppopchaos.com/), so I joined the fun!  It
seemed s/he was only interested in bursting bubbles, not creating
them, so I created some, and then joined the fun and we just popped
alll the bubbles.  The white ones kept coming back, as they do, but
then after a while I created a bunch of blue bubbles in a row, so he'd
(be more likely to) know it wasn't computer-generated bubbles, well..
not algorithm generated,.. well, anyway, then blam!  he made a bunch
of yellow bubbles, and raced up the leaderboard and then suddenly
vanished!  I was like O_o what happened?

I found houston:admin, which perfectly augmented the app with DB admin
skillz.  Perfect!  I discovered what happened: in his flurry of
creates, rancidpony won a race with the server and created more
bubbles than he had points to create!

His point value went negative and he promptly vanished from the high
score list, because that's how I was distinguishing *my* account
(which always has permissions to create, despite its score of -2300 or
something.

So I retooled the logic which populates the leaderboard to say admin
cannot join, but negative score people are welcome.  So rancidpony has
-35 points and is halfway up the leaderboard!

AND [rancidpony is credited](http://www.poppopchaos.com/about) with
finding a bug. Thanks!
