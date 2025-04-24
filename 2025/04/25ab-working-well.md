---
title: "AB working well"
tags: [ "2025", "ab", "work", "update" ]
author: Rob Nugen
date: 2025-04-25T08:34:00+09:00
draft: false
---

For the past few days I have been working on AB.

For years, I have been working on their frontend and backend servers, abf, and abb, respectively.  Alfonzo suggested we split abb and abf because they serve quite different purposes.  One for clients; the other for admins.

That split happened years ago and has been a great boon to keep things simple and safer to deploy and test.

The only downside of this is some of the low level code needs to receive similar changes on both sites.   But now both of them are working on a server running PHP 8.1, with PHP 8.3 in the future.

To boost the security, I added 2FA to the admin site. I even used KMS to store the seeds so they're harder to spill.

In other news, soon I'll be working on my own version of the image server they use. 
