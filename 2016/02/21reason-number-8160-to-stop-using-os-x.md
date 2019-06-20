---
title: reason number 8160 to stop using OS X
tags: [ "finder" ]
author: Rob Nugen
date: 2016-02-21T09:43:53+09:00
---

## 09:43 Sunday 21 February 2016 JST

Okay so I'm trying to post a sad+funny thing about IBM customer
service.  I took a screenshot of the email they sent and opened my
screenshot directory in Finder.

or *tried* to open the directory in Finder, but it just showed the
loading gif and didn't load the directory contents.

So I force-quit Finder and it quit, but now will not reload.

* CPU is at 7% usage.
* Hard drive has 13 Gigs available.
* uptime is 17 days

    $ uptime
    9:53  up 17 days, 15:20, 3 users, load averages: 2.31 2.37 2.31

Everything seems to be responding fine except Finder.

sigh

rebooting my machine now.

## 10:04

Okay, at least I know *why* it was happening.  I had stopped hitting
Cancel on a series of modal popup windows requesting access to my
keychain.  Skype and Messages and a bunch of apps that I don't always
want to have access were repeatedly asking for it.  Anyway, it's a
modal dialog in that it blocks Finder from doing anything else.  I had
just shoved it off to the side to get it out of my way.

After closing all my other windows, I saw it down there. gah fucking
hell
