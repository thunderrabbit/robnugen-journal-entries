---
title: mysql pagination problem
tags: mysql
author: Rob Nugen
date: 2016-12-28T15:12:39+09:00
---

## 15:12 Wednesday 28 December 2016 JST

I'm considering asking this question on stackoverflow or another
stackexchange site.

I've got a mysql table of widgets.  The widget table has about 80,000
rows and 100 columns.

My client has an index page where they can see a list of widgets.
They can filter and sort the list arbitrarily.  Pagination on the list
works fine.

When a widget needs to have its data edited, user clicks the row and
is taken to a widget edit page, which includes buttons to go to
previous and next widget in the list.

The previous / next buttons work fine about half the time.

However, when client edits the record in such a way that the record no
longer matches the original mysql query that created the list, the
next button skips the widget that should have been next.

My solution for now is to save the indices of 1000 widgets, sorted by
the query and centered around the selected widget.  This works until
the client clicks next as few as 500 times, they will have no "next"
record even though the original list said there were more.

I've tried saving indices of *all* the widgets, but it takes too long
in case the list includes all 80,000 widgets.

Is there a name for this problem?  If not, how about "paginedit"?
"mysql paginedit" currently has no hits on Google.
