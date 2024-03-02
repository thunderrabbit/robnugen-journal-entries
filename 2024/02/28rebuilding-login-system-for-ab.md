---
title: "rebuilding login system for AB"
tags: [ "2024", "work", "ab" ]
author: Rob Nugen
date: 2024-02-28T19:29:00+09:00
draft: false
---

I'm simplifying the code used for logins for AB.  I found some old code written 12 years ago:

```
session_destroy();
session_regenerate_id();
```

I don't know how that code worked 12 years ago, but it now throws a warning.

session_regenerate_id(): Session ID cannot be regenerated when there is no active session 

I fixed it as

```
session_destroy();
session_start();
session_regenerate_id();
```
