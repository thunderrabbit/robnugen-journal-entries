---
title: "Added debug level to Quick"
tags: [ "2025", "debug" ]
author: Rob Nugen
date: 2025-01-09T16:50:00+09:00
draft: false
---

Now Quick has a field for Debug, defaulting to 0.

Next step is to add an extra step to optionally post the journal entries.

* [*] If the commit seemed to work
* * [*] Show the output of `git log --oneline --all`
* * [*] Show a new button like [Deploy]
* [*] If [Deploy] is clicked
* * [*] Merge `master`
* * [*] Run deploy script
