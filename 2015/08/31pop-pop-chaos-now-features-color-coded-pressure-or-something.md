---
title: Pop Pop Chaos now features color-coded pressure or something
tags: poppopchaos
author: Rob Nugen
date: 2015-08-31T00:11:52+09:00
---

## 00:11 Monday 31 August 2015 JST

Nice!  Fred suggested I use color to indicate how close a bubble was
to popping.  I told him it was a good idea, though I already had it in
mind, possibly from Travis or Johan, but just hadn't implemented it
yet.

Now it's part of the game, and was reallly easy to do, thanks to d3:

I changed

    var circleColor = function(d) {
      return d.color;
    };

to

    var circleColor = function(d) {
      return d3.rgb(d.color).darker(2*(d.touches/d.maxTouches));
    };

https://archive.is/rLEVo shows the latest snapshot I've taken.
