---
title: CB is moving away
tags: work
author: Rob Nugen
date: 2017-06-14T12:17:59+09:00
---

## 12:17 Wednesday 14 June 2017 JST

Today is the big day to move CB to new servers.  I reset the master
password after it became apparent that the normal user cannot dump the
DB.  CB was still not able to run mysqldump, so they ended up just
getting a snapshot from their AWS RDS instance.

I hope hope hope hope the transition goes smoothly.  Today I have been
giving some advice but not actually *doing* anything (except reset the
master password) because I have not been made privy as to what exactly
they want to do with the data.  Curiously enough, I will be glad when
I no longer get requests to support CB changes.  I hope hope hope
their new sysadmins can interpret their requests more easily, and
explain why certain things are not doable.
