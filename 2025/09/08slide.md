---
title: "Slide"
tags: [ "2025", "slide", "ai", "game", "puzzle" ]
author: Rob Nugen
date: 2025-09-08T09:13:00+09:00
draft: false
---

AI and I made a game I called Slide to help me practice my favorite game on LinkedIn.

It's nearly finished enough to release, although I'm not sure if it can handle a Reddit or HN hug.

https://slide.chatforest.com/

Basically, you drag your finger on the grid to complete a hamiltonian path, hitting certain anchor points in order and not crossing barriers set between some of the squares on the grid.

[![2025 sep 08 slide puzzle 378 1000](//b.robnugen.com/journal/2025/thumbs/2025_sep_08_slide_puzzle_378.png)](//b.robnugen.com/journal/2025/2025_sep_08_slide_puzzle_378_1000.png)

It generates endless 5x5 or 6x6 puzzles on demand, saving them in the database as permanent fixtures for that can be played by other players who reach that puzzle ID.

To reduce cheating, players get a single shot at each puzzle and their subsequent solve times are not counted.

One downside: the code cannot yet make interesting puzzles for 7x7 or 8x8 grids.

AI and I therefore created a builder mode where I can make those puzzles manually.  It's pretty cool but I'm not sure that they are being used by the game itself after I build them.

Visually, the game grid is a bit too wide for the screen on mobile Firefox, and unplayably wide on DuckDuckGo browser, at least on Android.


