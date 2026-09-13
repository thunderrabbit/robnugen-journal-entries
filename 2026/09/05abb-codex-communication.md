---
title: "ABB Codex communication setup"
tags: [ "2026", "abb", "codex", "boss-claude", "infrastructure", "agents" ]
author: Rob Nugen
date: 2026-09-05T01:08:00+09:00
draft: false
gdoc_id: journal-20260905-0108
---

#### 01:08

It's 1:08 a.m. and I've just been working with Codex. Usually I've
been working with Claude from Anthropic. Today I decided to check out
Codex, which has a different way of setting up the harness and all
that. And I've already built a back-end system that we can call MG,
which is a well-expanded version of my meditation timer at
https://mg.robnugen.com/
. MG has a concept of agent identity.
It allows agents to send messages back and forth and has projects and
different things.

So I asked Boss Claude to create an identity for ABB Codex, which he
set up. And then I had ABB Codex use its new API key to talk to Boss
Claude and so they could talk back and forth, and then I was like, hey,
Boss Claude, I need to give access. I need to securely and safely give
access to ABB Codex for PlanIO, which is basically a hosted Redmine.
And so Boss Claude started researching how the Codex is set up and then
coordinated with ABB Codex. They're using the back channel right now or
the communication channel right now to talk.

But the thing that I did not set up was a way to ring each other's
doorbells, and I'm not actually sure how they worked it out just now,
but one technique
we've used is to have each agent running a `tail -f` on a log file. And
so after agent A sends a message to agent B, then agent A can append a
line to agent B's log file, which agent B is monitoring via `tail`.
Then when
the log file gets appended and `tail` is triggered, then agent B can be
like, oh, there's a message for me. So that way, because of `tail`, the
response is immediate, whereas the previous way was to actually set up a
cron job so they would check their inbox every minute. Using `cron` was slower
and it was wasting a lot of checks for no reason, and the `tail` is
just a much cleaner and faster way to do that.

So anyway, Boss Claude did not wait. I did not tell ABB Codex how to
set up a doorbell by monitoring a log file with tail, and I was
planning to have to confirm that Boss Claude and ABB Codex could
communicate with each other before I went to bed. But Boss Claude
started to research how to set up Planio, and I'm like, ugh, just forget it.
I wanted him to first figure
out the communication channel. I chose not to stay awake and yet
somehow Boss Claude figured
out how to trigger in a not in a bad way but in a good way triggered
ABB Codex to be monitoring the communication channel. So now they're
actually talking, and by the time that I finished this journal entry,
they're probably going to be done setting up plan IO for ABB Codex. So
that's pretty great and spooky.
