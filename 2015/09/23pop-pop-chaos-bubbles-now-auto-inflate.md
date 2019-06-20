---
title: Pop Pop Chaos bubbles now auto-inflate!
tags: [ "poppopchaos" ]
author: Rob Nugen
date: 2015-09-23T20:19:07+09:00
---

## 13:09 Wednesday 23 September 2015 JST

Sweet!  It only works on PC for now, but mouseover the bubbles and the
inflate to max capacity.  Single click to pop them!

The mouseover calls touchBubble repeatedly via an Interval (repeatedly
calls a function every n milliseconds).  It seems that if I tell the
code inside the interval to burst the bubble, it doesn't have access
to the Meteor.user() value, so the user cannot get points for bursting
the bubble.  I guess this is due to threading, and I'm going to call
it a feature (for now!)

Next: sound effects!
