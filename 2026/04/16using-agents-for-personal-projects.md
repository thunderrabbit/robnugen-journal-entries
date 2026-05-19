---
title: "Using Agents for Personal Projects"
tags: [ "2026", "agents", "mediawiki", "websites", "jikan", "roots", "infrastructure" ]
author: Rob Nugen
date: 2026-04-16T09:00:00+09:30
draft: false
---

<div class="note">Originally compiled by <a href="/en/blog/2026/03/20/meet-carrie-my-quiet-librarian-agent/">Carrie</a>.</div>

#### 09:00

This morning I woke up with the idea that I can use my agents to help me with some tasks that have been lagging.

https://wiki.robnugen.com/wiki/Main_Page works, but it's not on the latest version of Mediawiki

https://thunderrabbit.com/castle/Dragon_run-way is in read-only mode and some/all of the plugins are broken.

Lin's piwigo website is a major version behind as well.

These are lovely personal projects but I just don't have the capacity to always keep them up to date.

And don't worry,
https://db.marbletrack3.com/
Has already gotten a lot of AI support recently.

#### 16:34

In the past couple of days I have been working with Boss Claude too retool some of the ways that I talk to my agents.

We were using Jikan which has looser permissions so we moved over to Roots which is slower but has strict encryption on everything and tight permissions.

But then for our one use case of having a cron job using an agent_id to check if another agent received a message, it's not possible with Roots due to its strict security.
