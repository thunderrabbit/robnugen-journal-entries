---
title: "connect mouse events in Godot"
tags: [ "godot", "mouse", "" ]
author: Rob Nugen
date: 2017-12-14T23:13:06+09:00
---

## 23:13 Thursday 14 December 2017

I have an Area2D in Godot, with its Pickable value set ON.

I added a `_on_Area2D_mouse_enter` function, but it does not get
triggered when the mouse hovers over the Area2D.

Interestingly, adding a `_on_Control_mouse_enter` function *does*
work.

BUT, my `_on_Control_input_event` function does *not* work.

## 08:25 Friday 15 December 2017

Yay!  I started a new Godot project, basing its core on
https://github.com/RodZill4/godot_inventory.git  Now I have
functions which respond to mouse clicks and mouse entry/exit.
Hopefully it will work the same with finger clicks, but I don't
honestly know.

Next step is to add pieces to this version.
