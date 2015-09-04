---
title: today at work
tags: work
author: Rob Nugen
date: 2015-09-01T18:38:32+09:00
---

## 18:38 Tuesday 01 September 2015 JST

Satomi came down at the perfect time; I had just finished and
committed a set of changes for a new process for the AB site.  They
want new data added to the historical primary tables, gleaned from
data in the secondary tables (basically log tables).

Basically things in the primary table can be active or inactive.  We
have a log of when they were activated and deactivated.  The cycle of
(in)active toggles can spans years at times, or could just be days.

Each month I take a snapshot of the primary data for doing trend
reports.  Now, the snapshots obviously know if their rows are active
or inactive at the time of the snapshot, but they don't know how
*long* they had been (in)active at the time of the snapshot.

That's what my new code needs to do.  Go back and look at the log,
calculate the ranges of (in)activity, and fill in the newly-created
blanks in the historical snapshots.  Fun!

Fortunately, it's a DB table "log" so there's no text parsing
required.  But I do have to deal with objects being set to inactive or
to active multiple times in a row. something like this, for item
number 5, (but with a lot more data haha):


    5  inactive 2004-03-06
    5  active   2004-08-28
    5  inactive 2006-11-12
    5  active   2007-07-28
    5  active   2007-09-24
    5  inactive 2009-06-21
    5  active   2010-04-03

