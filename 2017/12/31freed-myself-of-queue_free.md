---
title: "freed myself of queue_free"
tags: [ "godot", "queue_free", "crash", "" ]
author: Rob Nugen
date: 2017-12-31T05:07:19+09:00
---

## 05:07 Sunday 31 December 2017 -02

I have had a few crashes in Godot in the over the past couple of days,
and each time it was due to using `queue_free()` (or apparently
misusing it).  I took them out in favor of `hide()` and `remove()`.
The crashes seem to have gone away.

## 14:42 Sunday 31 December 2017 -02 (44 minutes to Dubai)

I would like to extend my custom Godot class, but have not been able
to figure out how to do it.  I found

    extends "classname.gd"

But I want to extend the scene as well.  I will try a couple things,
but I am getting tired haha.
