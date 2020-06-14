---
title: "ConSwi new scoring system"
tags: [ "conswi", "score", "code", "godot" ]
author: Rob Nugen
date: 2020-05-29T18:01:56+09:00
draft: false
---

* Pass each Dog level L by saving  L() Dogs.  Bears don't count.
* Get up to three stars per level by swiping specific shapes.  Any
  animal counts. (saves me a lot of programming)
* Decide with Dipendra how the two requirements and scores will be
  displayed on the game screen.

I wrote the above after untangling an issue we have had with ConSwi
for some time.  How do people pass each level?  Until now, the code
has been written that users can pass a level by collecting all the
swipes.  Tariq wanted to make it simply a certain number of pieces
collected.

Now by making those two separate scores, it solves another problem we
had, wondering how to decide how many stars the user gets for passing
the level.

Num Stars will be `floor(3 * (Number of Correct Shapes) / (Total Shapes
Requested))`

To actually pass the level, they just need to swipe shapes.  Any shape
will do, so long as it's at least 3 connected pieces.
