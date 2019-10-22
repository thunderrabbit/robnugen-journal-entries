---
title: good ness
tags: [ "work" ]
author: Rob Nugen
date: 2017-05-08T18:33:43+09:00
---

## 18:33 Monday 08 May 2017 JST


TL;DR: wasted a lot of time today.

Wall of crap:

I somehow confused myself and my vagrant VMs.  The big change I made
was to recreate my `~/.ssh/id_rsa` keys in my management box.  That
meant I could not connect to the other VMs until I put the public key
in their `.ssh/authorized_hosts` file, which I did, but then I could
not deploy the sites without giving the new key to bitbucket, and then
I ended up destroying and recreating a VM because for some reason the
"exact same" (*) deploys that worked before were not working because
they were being run as ubuntu instead of vagrant..  wait what?  How
could they possibly have worked before?  wth is going on fuckit and I
(archived and) wiped the box to recreate it, but *still* had problems
with the wrong user being used, and *then* I realied that on top of
all this, when I `vagrant ssh ab` to get to the ab box from my host, I
was being logged in to the mgmt box.  ffs I have wasted hours on this
so I am now starting new VMs from scratch (after downloading latest
Trusty64 from hashicorp (slower than Christmas here at the office for
some reason (between 57k/s and 200k/s)) and latest VirtualBox and
latest guestadditions so hopefully the mount thing will be fixed this
time.

(*) not exactly the same

## 19:06 Monday 08 May 2017 JST

It's only up to 64% downloaded so I am going to cancel the d/l and
head home.
