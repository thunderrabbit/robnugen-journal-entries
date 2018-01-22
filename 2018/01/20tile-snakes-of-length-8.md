---
title: "tile snakes of length 8"
tags: [ "tile", "game", "" ]
author: Rob Nugen
date: 2018-01-20T16:50:34+09:00
---

## 16:50 Saturday 20 January 2018 JST

I wonder how to find all contiguous 8-tile shapes.

They should be formable without crossing over my line.

These are okay

```
XXXXXXXX
```

```
XX X
 XXX
  XX
```

This is no good because I cannot reach all the Xs without backtracking.

```
 X
XXX
XXXXX
```

I guess I can slap it together on codemonkey.net or whatever
