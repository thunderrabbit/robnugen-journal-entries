---
title: Good coding on AB site
tags: [ "ab" ]
author: Rob Nugen
date: 2015-12-02T21:44:02+09:00
---

## 21:44 Wednesday 02 December 2015 JST

Actually I don't know if the code is good, but I'm having fun, and the
new part of the site is doing 90% (and counting) of the things I want it to.

Basically there's a report system which I made so they can create
reports without danger of destroying data.  There are some reports
they cannot create with my interface, so I created another report
system where I hardcoded the query and just let them run it.

The new system creates static output though, and they'd like to be
able to sort the output a la
[datatables](https://datatables.net/) which I have set up on most of
the AB admin site indices.  So I'm rewriting the defined report system
so the queries will be stored in the DB along with some meta data to
say which output fields should be editable.

It is even designed to go so far as to allow reordering the columns,
though only I control the column order for now.
