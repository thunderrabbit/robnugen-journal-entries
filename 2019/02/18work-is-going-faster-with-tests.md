---
title: "work is going faster with tests"
tags: [ "work", "tests", "ab" ]
author: Rob Nugen
date: 2019-02-18T10:23:20+09:00
---

##### 10:23 Monday 18 February 2019 JST

Although I have not gotten all the way to the part of MLAPHP that we
are supposed to be adding tests, I am close enough that I can add some
tests. They have helped a *lot*, like OMG how did I live without
tests?  It hasn't been so long that I don't remember what it was like,
and I sure like this better.

Right now I am working on upgrading to a new version of Datatables so
it can access `table.row()` but I get the error

    Uncaught TypeError: table.row is not a function

It's not just not a function... `table.row` is `undefined`.

Maybe 1.10.19 of datatables is not the latest after all..
