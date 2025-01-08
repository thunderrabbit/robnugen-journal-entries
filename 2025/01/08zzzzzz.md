---
title: "zzzzzz"
tags: [ "2025", "" ]
author: Rob Nugen
date: 2025-01-08T22:59:00+09:00
draft: false
---

I'm super tired but having fun with Quick, having gotten it to correctly find the next word in the backwards story, I then started to extract class NextStoryWord from being instantiated inside the function that needs the next word and instead just sending the word in..  but now it ain't working! 

Oh I see why.  There's a side effect inside the class where it was working: it sets the current working directory to where NextStoryWord needs to do its magic.

Aight I'll probably possibly maybe fix that tomorrow.