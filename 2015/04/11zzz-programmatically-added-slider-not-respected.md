---
title: programmatically added slider not respected
tags: [ "sleepy", "unity3d", "joint", "slider", "2d-physics" ]
author: Rob Nugen
date: 2015-04-11T01:29:36+09:00
---

## 01:29 Sunday 12 April 2015 JST

I posted this at
[https://answers.unity3d.com/questions/945007/programmatically-added-sliderjoint2d-not-respected.html](https://answers.unity3d.com/questions/945007/programmatically-added-sliderjoint2d-not-respected.html)

How can I make sprites fall straight down, and resist any sideways motion whether by dragging or physics?

My code instantiates a prefab at runtime which has an attached script.

The script runs the following function after a while:

	void addSliderJoint() {
		myVerticalSlider = gameObject.AddComponent<SliderJoint2D> () as SliderJoint2D;
		myVerticalSlider.angle = 90;
	}

After this functions runs, I'd like the sprites to only move vertically, but they seem happy to move without restriction.  I can "see" the SliderJoint2D in the inspector during runtime, and if I change its settings in the GUI, the sprites suddenly respond to it.

Sample repo available at [https://github.com/thunderrabbit/finna-be-octo-wallhack](https://github.com/thunderrabbit/finna-be-octo-wallhack)
