---
title: "Headed to Otemachi"
tags: [ "plans", "tariq", "conswi" ]
author: Rob Nugen
date: 2021-11-26T14:26:38+09:00
draft: false
---

(written 14:26 Friday 26 November 2021 JST)

Headed to Ginza no wait Otemachi after Tariq found Ginza to be busier
than expected.  We plan to talk about ConSwi, which I have gotten just
past the point where it was when I wiped some code last night or so.

Now in addition to playing sounds, the demonstration swipe can go
vertically instead of just horizontally.

But now it only goes vertically, not horizontally.

To fix it for certain, we would need to implement A* but instead of
that, I have just done some hacks.

Probably going to  do something like

<pre>
**** = R R R

**
 ** = R D R

***
  * = R R D

** = R D L U
**
</pre>

yep that makes sense.  Now, how to encode that?