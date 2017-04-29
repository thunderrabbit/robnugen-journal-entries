---
title: TY, T!
tags: work
author: Rob Nugen
date: 2017-04-29T09:26:58+09:00
---

## 09:26 Saturday 29 April 2017 JST

TL;DR: https://www.packer.io/

Travis gave a fantastic reply to my tale of disconnectivity.  I am
going to dive in to Packer for a few units of time, and then try to
restore connectivity to my old VM, and then try to finish installing
site on my new VM, and then try to do the update I wanted to do
yesterday morning!

## 09:43 Saturday 29 April 2017 JST

Okay, let's install Packer!  Yay!  We can do so with brew.  But first
let's get brew up to date.

> $ brew update

worked okay.

> $ brew upgrade

is working, but apparently cooking my CPU, mostly to make Python 2 and
3.

I thought `brew update` would update the packages, and `brew upgrade`
would upgrade itself, but it seems to be the other way around.
Anyway, I intended to do both; I just did not think it would take so
long.. nearly all the time units available for Packer!

## 09:59 Saturday 29 April 2017 JST

Wow. `brew upgrade` completed, with these lines near the end of the
output:


    Upgrading boost --c++11
    <snip>
    🍺  /usr/local/Cellar/boost/1.64.0_1: 12,630 files, 404.4MB, built in 14 minutes 2 seconds

