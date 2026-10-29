---
title: "AI and I made a dashboard for my Dreamhost sites"
tags: [ "2026", "" ]
author: Rob Nugen
date: 2026-10-24T12:51:00+09:00
draft: false
---

[![2026 oct 25 new dh inventory dashboard 1000](//b.robnugen.com/journal/2026/thumbs/2026_oct_25_new_dh_inventory_dashboard.png)](//b.robnugen.com/journal/2026/2026_oct_25_new_dh_inventory_dashboard_1000.png)

I've been happily using Dreamhost Shared Hosting for nearly 20 years.  Over this time I have had multiple domain names, subdomains, databases, users, etc.. far more than I can remember in one sitting and I've lost track of plenty of the details.

Dream host has a control panel with which I can control everything, but they no longer have an API that allows me to control the control panel with the API.

Today, Claude helped me write a python script that can deterministically log in, go through and grab all the data in what we're calling a sweep, so it can look up all the users and databases etc etc that are in my account.

My new dashboard currently just basically shows me a copy of the data in Dreamhost, like what versions of PHP each of my sites run, and which user each site is on, blah blah.

My dashboard has access to an extra load of data in my brain: plans for the websites, bug and security fixes for sites, knowledge of which sites are clones of my new-DH-account-site, which ones allow registration, how to deploy each...

My goal is to get all the sites all running in the latest PHP (currently 8.5) automatic testing on future versions, tests all defined for each site, so AI can help me orchestrate everything semi autonomously, in some cases even receiving client requests and automagically building and deploying a fix to the dev site.

Am I vibe coding myself into a mess or into the glorious future of coding in spoken language?
