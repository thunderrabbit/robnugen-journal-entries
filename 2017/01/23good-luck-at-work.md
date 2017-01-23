---
title: good luck at work
tags: work
author: Rob Nugen
date: 2017-01-23T10:39:26+09:00
---

## 10:39 Monday 23 January 2017 JST

I need some luck today; I hope I can figure out Facebook's Instant
Articles.  Specifically, figure out why they won't reload articles
that have been updated in the RSS feed (with an expiry date in the
past), after I changed the GUID of the article, after I changed its
canonical URL.

## 12:57 Monday 23 January 2017 JST

Okay, the main thing I determined:

FB won't complain if we use a subdomain for the RSS feed, but it will
silently ignore it if it hasn't been approved.

Steps to fix

1. Turn off authentication for the subdomain (optional)
2. Get it authorized for use
3. Turn authentication back on (optional)
4. Use it as the Development RSS feed for Instant Articles
