---
title: Middleman is eating spaces
tags: middleman
author: Rob Nugen
date: 2015-03-26 17:22 JST
---

##17:22 Thursday 26 March 2015 JST##

Hmmm

It appears that Middleman is dropping spaces from certain image paths.

I think I wrote

     [![alt text](/thumbs/path to image.jpg)](/path to image.jpg)

which I think is correct, but Middleman is rendering

thumbs/pathtoimage.jpg for the thumbnail

The image names include kanji, so that may be triggering the problem.

Bah. `middleman init` is failing so I can't easily create a simple
test site to show in my bug report.

Why'd I choose Middleman again?  oh yeah, it's a site creator, not
just a blog creator.  Hmmm.
