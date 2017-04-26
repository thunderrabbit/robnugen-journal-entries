---
title: Got fake FS working on new server
tags: work
author: Rob Nugen
date: 2017-04-26T12:03:02+09:00
---

## 12:03 Wednesday 26 April 2017 JST

Nice.  Now that I've got a few Ansible playbooks set up (thanks,
Travis!), it's sorta kinda easy to spin up a new server with all its
personalized packages, bells, and whistles.

Today I got FS set up on a temporary server, including pulling a copy
of the DB and static files from the live server.

Basically, I need to split the live server into two: one that we can
give to CB and one that we continue to use for AB.
