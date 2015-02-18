---
title: Today worked on AB DB
tags: work, db
author: Rob Nugen
date: 2015-02-16 22:32 JST
---

##22:32 Monday 16 February 2015 JST##

AB DB primarily consists of two big tables.  Table U has 77k records,
and 160 columns.  Table B has maybe 40k records and maybe 70 columns.
There's a 1-to-many relationship from B to U.  Doing joins on them
takes about 3 or 4 seconds.

That ain't good, considering the joins are done all the frickin time.

I guess that's why when I got the original data, a lot of what's now
in the B table was in the U table.  I was like, "normalization to the
rescue!" but now it's sloooowwwww.

About 20 columns in table U are varchar 200, so that's 2k UTF-8
characters, so 4k bytes per record (if they're all filled, which
they're not, but it's still overhead that I wonder if I can split into
other tables).

