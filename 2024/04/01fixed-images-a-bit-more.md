---
title: "fixed images a bit more"
tags: [ "php", "images", "site" ]
author: Rob Nugen
date: 2024-04-01T10:02:59+09:00
draft: false
---

(written 10:02 Monday 01 April 2024 AEDT)

Today I fixed my image uploader to create 1000px x 1000px images as
well as thumbnails.  yay!

https://github.com/thunderrabbit/badmin.robnugen.com/commit/248f9319548270f18dc3cf0b287a1ae811ce8d23

Now I just need to tell the index.php file to not create thumbs for
the 1000px images, but do show the 1000px images if they exist
