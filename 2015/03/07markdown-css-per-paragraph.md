---
title: Markdown css per paragraph?
tags: [ "markdown" ]
author: Rob Nugen
date: 2015-03-07T11:45:00+09:00
---

##11:45 Saturday 07 March 2015 JST##

Markdown allows me to write without having to worry about paragraph
tags and other markup.  I've got loads of experience writing HTML4
markup so it's a welcome reprieve. HowEVer, I'd like the option of
using specific CSS on certain paragraphs, specifically for when I
write my dreams.  My convention is to have green italics for dreams,
green without italics for lucid dreams (iirc from my old school
journal).

I tried putting a big &lt;div class='dream'&gt; around everything, and
that works for the green italics, but the separate paragraphs are
being squished into one big paragraph.

I've got Middleman using Redcarpet for markdown.  I dunno if it can be
easily tweaked at that level, or even maybe write some custom fencing
so I can write

    ``` dream

or

    ``` lucid

and have Redcarpet deal with them that way.

OR if I hafta do something so shocking as put paragraph tags around
each paragraph!
