---
title: "Tile shape matching algorithm"
tags: [ "tile", "game", "match", "shape", "algorithm" ]
author: Rob Nugen
date: 2017-12-21T08:27:46+09:00
---

## 8:27 Thursday 21 December 2017 -03

I am making a swipe game which requires the user to swipe specific shapes.

    XX
    XX

or

    XXXX

or

    X
    X
    X
    X

excetera (haha)

I will have a list of tile coordinates which were swiped.

    (3,3)
    (3,4)
    (3,5)
    (3,6)

Above coordinates would match the horizontal XXXX (or is it vertical? Anyway,)

I can imagine comparing the above list to a list calculated from

    f((3,3))

which would return the same list of coordinates by adding (0,0) (0,1) (0,1) (0,1) 

But that is error prone beyond my tolerance. (Esp given that it needs to work both directions, or in eight (8)! directions for the square shape)

I would like to just give a list of acceptable shapes as ASCII art like my XXXX above and let code do the rest.

What would this kinda algorithm be called?  Is it easiest to just grok
A* path finding or is that overkill?

## 18:44 Thursday 21 December 2017 -03

I figured out an algorithm in four parts:

    1) Parse
    2) Sort
    3) Diff
    4) Compare

Parse is optional, and is used to process my definitions in a shape library:

    Library = {Square: [
    0,0,0,0,
    0,1,1,0,
    0,1,1,0
    0,0,0,0
    ],

    Tee: [
    1,1,1,0,
    0,1,0,0,
    0,1,0,0,
    0,0,0,0
    ]}

However, the above (1) wastes space, and (2) is limited to 4x4 shapes.

So, add one more digit to tell the parser when to flip to the next line (increment y)

Then we have:

    Library = {Square: [2,
    1,1,
    1,1
    ],
    
    Tee: [3,
    1,1,1,
    0,1,0,
    0,1,0
    ],
    
    Vert5: [1,
    1,1,1,1,1],
    
    Horiz5: [5,
    1,1,1,1,1]}

Parse algorithm is annoying to type out well, but it basically poops out an array of Vector2s

Parse(Square) results in

    [(1,1),(1,2),(2,1),(2,2)]

in the first Library above, and

    [(0,0),(0,1),(1,0),(1,1)]

in the second Library above.

Having different definitions for the same shape won't work, so we Sort the Vector2s (actually they are sorted above) and Diff them:

Define Diff as

    Array[(0,0),
    Next-Current for each adjacent pair]

Bingo, consistent definitions for same shapes, no matter what shape or where in the grid they are defined.

    Diff(Sort(Parse (Square)))

is always

    [(0,0),(0,1),(1,-1),(0,1)]

I haven't done Tee yet, but 

    Diff(Sort(Parse([4,
    0,1,1,0,
    0,1,0,1,
    0,1,1,1])))

is always

    [(0,0),(0,1),(0,1),(1,-2),(0,2),(1,-1)(0,1)]

On the game grid, swiping a square results in an array of Vector2s which can be processed starting with Sort above and get the same Diff output.

Yay
