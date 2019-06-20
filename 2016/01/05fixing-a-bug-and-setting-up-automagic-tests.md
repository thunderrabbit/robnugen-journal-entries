---
title: Fixing a bug and setting up automagic tests
tags: [ "work" ]
author: Rob Nugen
date: 2016-01-05T02:51:07+09:00
---

## 02:51 Tuesday 05 January 2016 JST

By far the large part of my time today was spent in a bit of a panic
trying to figure out why the AB site was acting horribly wrong.  Not
even the most basic thing was working: logged in users couldn't sort
nor even filter the properties.  Yikes stripes!

I was really close to a major upgrade which was alllllmost working on
my local system.  I got it finished and then spent over an hour
testing, and then push the whole thing to live site.

I checked the live site and the problem was still there!  Holy crap
crap crap crap what is going on?????

Well, I'll tell ya: I had wiped a record associated with my login
account, so a JOIN was returning null.  I recreated the record and the
site worked fine.

Whew.

I don't actually know how the record was removed, but I didn't see any
other users who were affected, so I'm going to ignore that pesky
little detail for now.

But.

All of this inspired me to look again at testing systems.  I have
looked at Selenium more than three times and have never been able to
properly install the thing, much less get started with tests.  But
today I found two awesome test systems: https://ghostinspector.com and
http://casperjs.org/

Ghost Inspector is suuuuper easy to use.  I was able to set up a few
tests on the live site in about an hour.  The most difficult part was
figuring out how to compare two values on the page.

Do it like this:

[![Ghost Inspector can compare values](//b.robnugen.com/journal/2016/thumbs/ghost_inspector_comparing_values_2016-01-05_at_3.01.19_AM.png)](//b.robnugen.com/journal/2016/ghost_inspector_comparing_values_2016-01-05_at_3.01.19_AM.png)

Casper takes a bit longer to work out how to write the tests, but it
has the awesome advantage of running locally, so it can access my
websites running on my machine.
