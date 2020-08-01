---
date: '2020-08-01T15:13:32+09:00'
entry_title: 'working on my copy of Micropub'
journal: 'https://robnugen.com'
posttype: journal
published: true
slug: working-on-my-copy-of-micropub
title: 'working on my copy of Micropub'
---

The original author of micropub had some interesting code that allows the [type of entry to inform which function to call](https://github.com/skpy/micropub/blob/648c06fba4e6ba89e86f7a7e149e885dd9f7692a/inc/content.php#L106) to process the data.  He had used it to deal with entries related to Twitter.

I'm using it to split out my specific customizations for my website robnugen.com, which will [process](https://github.com/thunderrabbit/micropub/commit/844ef06c17b28e37e08c9f37ef0314c79ffbcb4a#diff-9f37b4373c14a00ad45c2a0cbddf441e) my journal entries and my dream entries.

I had to make a couple of tweaks to Quill so I can tell Micropub whether I'm [sending a journal entry or a dream entry](https://github.com/thunderrabbit/Quill/blob/8df229b7bdf010b5fc15646032156a26cee8b79d/views/journal.php#L29).

During all of this I have not had to touch the OAuth parts of the micropub spec.  I'm grateful for that separation of layers. It has helped make progress go much faster.

Next, I need to [fix the dream entry processor](https://github.com/thunderrabbit/micropub/issues/3) to add paragraph tags with class = dream around each substantial bit of text in the body of the entry.

Then I want to [adjust the front matter](https://github.com/thunderrabbit/micropub/issues/4) so it is in my preferred order and includes just my preferred items.

Oh and I definitely have to figure out how to get the tags working properly.  My copy of Hugo doesn't know it's a dream without it having a dream tag.
