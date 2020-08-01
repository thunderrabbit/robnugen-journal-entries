---
date: '2020-08-01T15:13:32+09:00'
entry_title: 'working on my copy of Micropub'
journal: 'https://robnugen.com'
posttype: journal
published: true
slug: working-on-my-copy-of-micropub
title: 'working on my copy of Micropub'
---

The original author of micropub had some interesting code that allows the type of entry to inform which function to call to process the data.  He had used it to deal with entries related to Twitter.

I'm using it to split out my specific customizations for my website robnugen.com, which will process my journal entries and my dream entries.

I had to make a couple of tweaks to Quill so I can tell Micropub whether I'm sending a journal entry or a dream entry.

During all of this I have not had to touch the OAuth parts of the micropub spec.  I'm grateful for that separation of layers. It has helped make progress go much faster.

Next, I need to fix the dream entry processor to add paragraph tags with class = dream around each substantial bit of text in the body of the entry.

Then I want to adjust the front matter so it is in my preferred order and includes chest my preferred items.

Oh and I definitely have to figure out how to get the tags working properly.  My copy of Hugo doesn't know it's a dream without it having a dream tag.
