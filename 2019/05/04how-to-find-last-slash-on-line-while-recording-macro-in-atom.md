---
title: "how to find last slash on line while recording macro in Atom"
tags: [ "atom", "issue", "macro" ]
author: Rob Nugen
date: 2019-05-04T21:44:09+09:00
---

##### 21:44 Saturday 04 May 2019 JST

In my workflow, I end up with image URLs like this

```
https://b.robnugen.com/art/marble_track_3/track/parts/2019/2019_may_03_caret_splitter_rudder_planner_3.jpg
```

and I want to convert them to markdown with thumbnail like this:

```
[![2019 may 03 caret splitter rudder planner 3](//b.robnugen.com/art/marble_track_3/track/parts/2019/thumbs/2019_may_03_caret_splitter_rudder_planner_3.jpg)](//b.robnugen.com/art/marble_track_3/track/parts/2019/2019_may_03_caret_splitter_rudder_planner_3.jpg)
```
(N.B. the title came from the image filename, and `thumbs/` has been inserted into the thumbnail's URL)

With Emacs, I can do it with a [custom keyboard macro](https://github.com/thunderrabbit/home-directory/blob/master/.emacs#L84), which starts by moving point to the end of the image URL then `I-search backward` to find the last `/` in the URL.  Then I can easily extract the name of the image from which I can get the title of the image.

I installed [atom-keyboard-macros](https://github.com/JunSuzukiJapan/atom-keyboard-macros), but it [fails when I try to find previous with ⌘-⇧-G](https://github.com/JunSuzukiJapan/atom-keyboard-macros/issues/43).

Perhaps there is a whole different atom.io way to go about converting the image URL into a markdown-friendly string.  Do you know of one?
