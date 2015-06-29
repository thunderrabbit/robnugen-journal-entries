---
title: AB site updates
tags: work, ab
author: Rob Nugen
date: 2015-06-29T21:20:32+09:00
---

## 21:20 Monday 29 June 2015 JST

Yesterday or maybe this morning I finished a relatively significant
change to the AB site.  Now they can edit some records which were
never meant to be edited, just logged...  but the logs are of
human-driven changes and sometimes they have errors which need to be
fixed, so they need to be fixed in the log as well.  Fair enough!

Then got another request to log one more thing in that log.  This
thing is only available in a many-to-many linked table, but
fortunately they only want the max value, so it's clear which one
should be logged.  Once I add it to the live site, they'll have 12
years of zeros in that field from not having logged it before.
