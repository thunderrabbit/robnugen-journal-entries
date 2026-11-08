---
title: "Autonomous updates"
tags: [ "2026", "" ]
author: Rob Nugen
date: 2026-11-08T12:49:00+11:00
draft: false
---

 I've got about N+1 sites based on my template site running on Dreamhost, with their respective domains using anything from PHP 8.2 to PHP 8.5.  After making a website that displays a dashboard with daily update of all the DH sites, I just designed a new API endpoint on https://mg.robnugen.com/ that will tell my agent what is the "next" thing to do, callable by any of my agents with skill `/next-mg-step`.

The skills include using Rector to fix the source code to modern PHP standards, and doing the same for JavaScript, libraries and generating testing harnesses to make sure everything works properly.

Now it's being tested on one of my sites.