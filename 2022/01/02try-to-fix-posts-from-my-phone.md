---
title: 'try to fix posts from my phone'
author: 'Rob Nugen'
date: '2022-01-02T19:16:39+09:00'
---

Quill uses Micropub magic to log in with my domain as an identifier.
It worked until my main site started getting `en/` or `ja/` after the
domain to decide what language to present.

I fixed the language suffix issue by
[inserting](https://github.com/thunderrabbit/barefoot_rob/commit/8baf116b1a60742b9afc7ae0c0b9e473515be9b9)
[the](https://github.com/thunderrabbit/barefoot_rob/commit/af032097f6a3e85d3d5d1df01d2a29bf394503ae)
[required](https://github.com/thunderrabbit/barefoot_rob/commit/4f958cc2094696498b5ccd7f33ac1438a398bbb2)
`rel` tags on my [alias page](https://github.com/thunderrabbit/barefoot_rob/blob/4f958cc2094696498b5ccd7f33ac1438a398bbb2/layouts/alias.html)

Now I can create entries with my phone, but cannot build the site from my
phone.  I think it's because the repository for my journal is
separate and the repository for my main website.

I thought the problem was just that I need to run the correct script (which
changed after I split the journal to its own repo), but it didn't work.
