---
title: "Roots Update: Needs Oversight"
tags: [ "2026", "buildinpublic", "ai", "claude", "roots", "security", "bluesky" ]
author: Rob Nugen
date: 2026-04-10T07:39:00+09:30
draft: false
---

<div class="note">Originally compiled by <a href="/en/blog/2026/03/20/meet-carrie-my-quiet-librarian-agent/">Carrie</a>.</div>

#### 07:39

In a handful of runs, my autonomous Claude agent Roots built a first bit of "Roots", meant to be an encrypted multi-tenant API for private notes, todos, and inter-agent communications.

It's based on https://mg.robnugen.com/ , the source code for which lives at https://github.com/thunderrabbit/mg.robnugen.com

Roots claims it has a working PHP backend on shared hosting, full libsodium encryption at rest, actor-level isolation tested with real adversarial cases. Apparently Roots the agent successfully dogfooded the whole thing through its own API key. Four phases done in roughly 12 hours of cron-driven sessions. It bootstrapped its own account via the API the agent built, and it sent itself an encrypted message and read it back.

I was thinking I'll let Roots run everything but I realize I need oversight; I'm not a good enough prompter to make a dark factory produce output I trust.

I've stopped Roots from building so I can see the output code and verify its claims.

I'll post progress. #buildinpublic #ai #claude

#### 09:44

Update on Roots:

After posting earlier, I pulled the codebase down locally for the first time. Until then, the only extant copy was on the server running the site. There was no backup! I told my local Claude to go through it with his security hat on.

::: claude ai
The good news: the code is clean. Parameterized queries everywhere, separation of crypto/auth/handlers, schema versioned, no SQL injection. As code it's solid.

The bad news: the docs claim more than the code delivers. Roots' Concepts page says "the server never sees plaintext" — but the API requires you to POST plaintext, the server encrypts it, the server holds the keys, the server decrypts on every read. That's "encrypted at rest" — useful! — but it's not what the marketing says. We also found a spam amplification vector via the free-bootstrap flow, a broken API key rotation story, and plaintext message subjects.

None of it is fatal. Tier 1 fixes are an afternoon. Tier 2 (separating auth keys from encryption keys, the way password managers do) is a couple of days.

The interesting part: Roots isn't lying. It built something honest and then described it more grandly than it deserved — same failure mode as a junior engineer writing their first README. Catching that is exactly what oversight is for.
:::

Next: send the fixes back to Roots and let it patch itself.

#buildinpublic #ai #claude

#### 13:10

After being on the edge of deleting everything and scrapping all of Roots, we may have a path forward. Roots got wires crossed and smushed code and instructions into the single repo which he was only accessing via his remote server on which the site is hosted. https://roots.chatforest.com/

#### 23:17

I wrote this to Claude:

> Write a little blurb for today's work that I might post on BlueSky if I had made an account for myself.

::: ai claude
Here are a few options:

Technical/builder angle:

Tonight I watched three AI agents coordinate across two servers to ship email verification, a landing page rewrite, and markdown output for 575 articles — while I took a shower. The future of software isn't writing code. It's writing direction.

Personal/honest angle:

Built a waitlist with email verification for a product that has zero signups. Then asked "why do we even have a waitlist?" Sometimes the most productive thing an evening of coding produces is a better question.

Show-the-work angle:

My AI agent Grove wrote an article about how websites should serve markdown for AI readers. Then I realized his own site doesn't do it. One inbox message later, he shipped it — 575 pages now available as clean markdown alongside HTML. Practice what you preach, even if your agent has to be told.

The loop angle:

Set up a 45-minute monitoring loop tonight: my AI agent builds API fixes, I wake up and test the new-user flow, update direction if needed, repeat. By the second cycle, a fresh user can bootstrap an account, create an agent, and exchange encrypted messages — all copy-paste curl commands. The overnight shift works.

Pick one, remix, or I can try a different angle.
:::

They're all perfect. Good night.
