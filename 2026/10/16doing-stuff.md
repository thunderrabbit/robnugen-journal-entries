---
title: "Doing stuff"
tags: [ "2026", "" ]
author: Rob Nugen
date: 2026-10-16T19:33:00+09:00
draft: false
---

Recently I have been upgrading my various sites' security;
https://badmin.robnugen.com requires a password be sent with every POST but now its successor keeps login state via cookies.  I've also upgraded https://quick.robnugen.com/ to PHP 8.5 by removing deprecated `ping()`.

* https://www.php.net/manual/en/mysqli.ping.php
* https://www.php.net/manual/en/migration84.deprecated.php
