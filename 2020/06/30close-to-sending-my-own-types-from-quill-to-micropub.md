---
title: "close to sending my own types from Quill to Micropub"
tags: [ "micropub", "quill", "journal" ]
author: Rob Nugen
date: 2020-06-30T20:13:18+09:00
draft: false
---

I am nearly able to post journal entries to my (demo) website using
Quill and Micropub.

I copied the form template for Quill's "note" type and have mostly
tweaked it to send journal entries.  The entries are being sent, but
my instance of Micropub does not yet detect they are journal entries.
It is defaulting to Article, even though I tweaked a few things to add
journal to its known vocabulary.
