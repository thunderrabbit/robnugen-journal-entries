---
title: "Split my journal to separate branch"
tags: [ "branch", "journal", "test" ]
author: Rob Nugen
date: 2021-08-30T16:43:08+09:00
draft: false
---

It used to take over a minute to compile my site if I changed
anything because the journal has a buch of pages.

So in the master branch, I have deleted the journal content from

`content/journal`

and in the journal branch, I have deleted content that is not in

`content/journal`

On my server, I have two directories, one open to the master branch,
and one open to the journal branch:

* `~/barefoot_rob_master/`
* `~/barefoot_rob_journal/`

Since the journal site is updated less frequently, has no links from
the top page, and attracts limited readers, (Hi Travis!), I update it
less often.

Hugo builds the main site in about 10 seconds, and takes its sweet
time to build the journal site.

This also makes pagination on the journal page include only journal
entries.  I want to do the same with the other types of pages, but
have not yet figured out how to do it.

Because `content/journal` is not bogging down the master branch
builds, I am happier to send my repo to the Hugo community to see if
someone can help me fix the pagination the way I want.