---
title: work
tags: work
author: Rob Nugen
date: 2017-05-15T16:28:57+09:00
---

## 16:28 Monday 15 May 2017 JST

Moe Joe.

CB was like 'um where are the images in our app?'

Turns out the app source hardcodes the image server domain name
instead of reading it from the API the app uses.

Spent 1.5 hours on phone with AWS support trying to get our domain
pointed to CBs new image server.  Ended up doing it at DNS level
because I could not get redirects to work from the server.  I guess
this way is better though, because now I can be pretty certain nothing
will be hitting the old server since DNS no longer points to it.

This is the first time AWS support wasn't able to solve my issue in a
30 minute phone call.
