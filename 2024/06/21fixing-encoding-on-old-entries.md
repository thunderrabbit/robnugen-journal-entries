---
title: "Fixing encoding on old entries"
tags: [ "emacs", "utf-8", "euc-jp" ]
author: Rob Nugen
date: 2024-06-21T17:32:53+09:00
draft: false
---

(written 17:32 Friday 21 June 2024 JST)

Apparently back in 2003 I was using EUC-JP as the encoding for my
journal entries.

I've found a relatively quick way to fix them with Emacs after finding
messed up characters:

1. C-x RET r  euc-jp   RET  yes  RET
2. C-c RET f  RET
