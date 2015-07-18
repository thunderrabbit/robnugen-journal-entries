---
title: AB site version 3 work
tags: work
author: Rob Nugen
date: 2015-07-17T12:23:32+09:00
---

## 12:23 Saturday 18 July 2015 JST

Yesterday I spent a few hours working on AB site; they basically want
a new login type for the frontend, so I need to restructure how the
logins are processed.  Basically I had put the email address in the R
table because only Rs can log in to the frontend, and we need to email
Rs from the backend.  But now Os can also login to the frontend, and I
don't want to check two tables (because it will soon be three or four
or 95) against login credentials.  So I'm moving the login credentials
to their own table and will have a linking table tell what personas
this particular logged in person has.

I hope it will work.

- - - -

Another big change is allowing Rs to see items which had been
suggested, but are no longer available.  The original site design said
only things which are "available" shall be visible.  Oh, unless they
*used* to be "available" and were mentioned to the Rs at that time.

Fortunately, this wasn't a very difficult to change to implement.
It's almost done now; I just need to tweak the color which means "no
longer available."
