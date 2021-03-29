---
title: 'need to update Quill and Micropub'
author: 'Rob Nugen'
date: '2021-03-28T18:02:36+09:00'
---

At this point I can write journal entries with my quill and micropub setup.  I want to be able to add entries that will show up on the top page of my website.

For now, that means they have to show up in the /quests directory.

I guess I will add a quest marker to quill and then hard code into Micropub the directory for my walk to Niigata.  I feel a little bit ashamed by having to hard coat something but maybe I can work out a way that makes sense.

Ugh

Hard code, not coat.

that brings up one more issue that I think is much much much much more critical.  Currently quill has a bug that I think is related to it doing a count of the characters in the entry.  It's got some JavaScript crap that doesn't allow me to edit text that is already been written.  even if I place the cursor and the text that I want to edit the edits show up at the end of the text.

* has

Fortunately, it's not really a simple case of programming, it's a simple case of ripping out some code so I hope it's super easy to fix it.

If it wasn't already clear, I'm using voice transcription to write this entry.
