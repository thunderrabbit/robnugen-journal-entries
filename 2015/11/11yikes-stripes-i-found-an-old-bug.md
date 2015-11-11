---
title: Yikes stripes I found an old bug
tags: bug, oops
author: Rob Nugen
date: 2015-11-11T15:45:40+09:00
---

## 15:45 Wednesday 11 November 2015 JST

Man oh man I'm lucky there aren't that many affected rows, but when AB
client requested that four fields in their main table allow DECIMAL
values and not just INTegers, I didn't change the
summary-of-main-table in the same way.  So each time a record was
saved to main table, its summary was saved with truncated values in
those fields.

Dang.

Fortunately, there aren't many times that decimal values are needed in
those fields.  (... which is why INTs worked for them originally.)

It's fixed now, but I need to create a query that will return all main
field records with decimal values so AB staff can go back and update
the corresponding summary-of-main-table records as needed.

## 16:33

For the query I mentioned, I could simply define a query to do it,
which I've done before, but all in code.  I wonder if I can set up a
query in the DB, give it some meta-data and let the code write itself?
