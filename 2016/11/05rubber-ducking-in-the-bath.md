---
title: rubber ducking in the bath
tags: [ "work" ]
author: Rob Nugen
date: 2016-11-05T00:42:24+09:00
---

## 00:42 Saturday 05 November 2016 JST

While taking a bath, I just talked to Fred for 45+ minutes on the
phone, rubber ducking a problem with him.

Before I started working on this a couple days ago, I did the
following:

1. Save a list of indices each time the user tweaks a search on index
2. Once a record is selected, use the indices to allow prev/next
3. Rerun the search if they go back to the index

This worked fine at first, but item #1 above now takes too much time
now that the DB has grown.

So my new idea was the following:

1. Save the query as user tweaks the search on index
2. Once a record is selected, run the query with LIMIT / OFFSET to
   allow prev/next
3. Rerun the query if they go back to the index

This makes #1 faster in that I don't have to save all the indices.  It
makes #2 slower in that I run the query each time, but oh well.

However, after talking to Fred, I realize #2 is flawed much more
deeply.  If a record is selected, then edited such that the query
won't find it, then the prev/next will get borked.

So, here's the solution I've decided to do:

1. Save the query as user tweaks the search on index
2. Once a record is selected, use the query to create a list of
   indices for the query and save them to disk
3. Use the list of indices to allow prev/next
4. Use the query only if they go back to the index

This way, #2 can be run while the initial record is loading, which
will take a bit of time, but I intend to run it asynchronously so it
won't really affect the load time, except for prev/next buttons.

Thanks, Fred!
