---
title: fixed a bug that I missed due to lack of testing
tags: bug, work
author: Rob Nugen
date: 2016-01-13T18:50:53+09:00
---

## 18:50 Wednesday 13 January 2016 JST

Oops shit.  I didn't fully test the system before putting admin server
live.  That shit won't happen again because I've got Ghost Inspector
on my side, helping me inspect the site.  I've taught it how to test
logging in, fucking up the log in, viewing the units list, and the
unit edit page, as well as the group-of-units list and the
group-of-units edit page.

I still need to teach it how to check inquiries, both saved and
unsaved, plus contacts, owners, sets and some other shit, but thanks
to Ghost Inspector Runscape package, I get 1000 free tests per month.
Yay!  I really want to pay them something though.  I paid Alan who
made ngrok so I figure I might as well pay Ghost Inspector cause it
seems they are actually doing more.

As soon as I get home, I'll push this not fully tested fix online,
then get back to making more tests.  Aww yeah.
