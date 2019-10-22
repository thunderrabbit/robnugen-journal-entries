---
title: "Got ConSwi dragging to follow properly"
tags: [ "conswi", "godot" ]
author: Rob Nugen
date: 2018-12-09T09:56:45+09:00
---

##### 09:56 Sunday 09 December 2018 JST

Still working on our [open source Godot game, ConSwi](https://github.com/thunderrabbit/conswi/) (which I think is
the perfect name, my partners are both saying they want a longer name
that is more descriptive), I got piece dragging to follow the mouse
properly.  Originally I had the drag only active when the cursor was
over the piece, so if the mosue went too quickly, the piece would no
longer receive the input and lose track of the piece.

Now I have refactored the code that was used to catch what I called
"Orphaned Swipes," meaning swipes that were released out in the play
field as opposed to exactly on the last piece.

OrphanSwipeCatcher is now GameSwipeDetector, and is now its own class,
which allowed me to move a decent amount of code out of Game.gd and
allowed drags to be detected even if the drag point moved off of the
piece being dragged.


This refactor is still in progress; there are some more functions
related to swipes and drags that can be moved to GameSwipeDetector.

Special thanks to Godot for dealing with memory management and
allowing my semi-noodled-code so I can focus on functionality of the
game.  I can imagine Travis' shock when he reads that!
