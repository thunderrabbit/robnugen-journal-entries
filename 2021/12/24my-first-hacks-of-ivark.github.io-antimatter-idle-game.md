---
title: "My first hacks of ivark.github.io Antimatter idle game"
tags: [ "hacks", "idle", "game", "run away", "javascript" ]
author: Rob Nugen
date: 2021-12-24T19:24:51+09:00
draft: false
---

(written 19:24 Friday 24 December 2021 JST)

https://ivark.github.io/ is an idle game / waste of brain focus.

To help me gain points with less brain focus, I wrote two little lines
of Javascript which automatically click buttons on regular intervals.

This clicks the "Max all (M)" button every 23 seconds.  It buys all
the things it can.

    setInterval(function(){$('#maxall').click()}, 23 * 1000)

This clicks the "Dimensional Sacrifice" button every 2 hours, to
amp up the something of the Eighth Dimension.

    setInterval(function(){$('#sacrifice').click()}, 2 * 60 * 60 * 1000);