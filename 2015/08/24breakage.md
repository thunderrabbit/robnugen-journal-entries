---
title: breakage
tags: [ "work" ]
author: Rob Nugen
date: 2015-08-24T16:27:41+09:00
---

## 16:27 Monday 24 August 2015 JST

So S-san at AB used the new function that I added, but it didn't seem
to fully work.  I tested it locally so I'm not sure what's wrong.
Basically it's supposed to edit historical data, but it didn't seem to
work for one set of tables.

While looking at the historical tables to see what had changed, I
found a record missing from all the tables!  Oh noooes!  Did my code
delete it somehow?  Yikes stripes!

Whew found it within 10 minutes because in the history it had been
associated with a different parent record (and I had been searching for it
and its siblings by the parent's ID).  S-san had merged the parent
records, which never before needed to merge historical records, but I
guess now it does.  Poo.

Then she said something else was broken; she can't sort properly by a
certain field (which is cause it's not 3rd normal and the data has
gotten out of sync).  Dang, "okay can you make a ticket in Redmine?"

"Oh I forgot to tell you, Redmine isn't working."

Awwww man.

- - - -

On the app front, Tariq and I released Pongdemonium to all regions,
but App store is saying it's not available in Japan.  itunesconnect says
it is available in Japan.  What to do?

