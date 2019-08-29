---
title: "AB RDS AZ"
tags: [ "work" ]
author: Rob Nugen
date: 2019-08-29T13:17:38+09:00
---

##### 13:17 Thursday 29 August 2019 JST

I got AB's DB on RDS, but had it in a different AZ than the server
(oops) which caused some slowness that AB noticed.  I turned on
Multi-AZ and rebooted the RDS instance with "failover" selected and
now AB's RDS in AB's EC2's AZ makes it noticably faster.  Yay!
