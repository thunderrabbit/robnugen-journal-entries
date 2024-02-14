---
title: "good work today with Graphite and Rector "
tags: [ "2024", "work", "rector", "php" ]
author: Rob Nugen
date: 2024-02-14T17:21:00+09:00
draft: false
---

Today I sorta kinda got the hang of Graphite for dealing with git.  I'm still more used to command line git, but Graphite does allow some quick rebasing of a whole stack of commits.

A lot of this will apply to AB as well, where I'm also in the middle of a big upgrade from PHP 7.4(?) to PHP 8.2, while also doing some development work for what basically amounts to magic link logins.

Yesterday I split a Codeception test into multiple tests because each one takes about 20+ seconds to run.  One of the tests was failing due to aging data on the system.  I refreshed with live data and the test passes 😁 yay!

But now other tests are failing because they relied on bespoke data.  Hopefully I can easily fix them to work on live data.