---
title: sample json over https
tags: [ "json", "https" ]
author: Rob Nugen
date: 2015-10-05T09:16:50+09:00
---

## 09:16 Monday 05 October 2015 JST

Going through a toot to create a tvOS app and need to download some
json over HTTPS, or create an exception in the app.  I set up HTTPS
with startssl clunky wizardry and presto:

https://apps.chatforest.com/tvos/api/1/sample.json

The data is taken from

https://www.themoviedb.org/

Which says I can just use https, but my tvos app gets a certificate
warning.

- - - -

