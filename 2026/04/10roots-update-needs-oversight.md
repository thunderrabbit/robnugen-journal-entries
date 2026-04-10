---
title: "Roots Update: Needs Oversight"
tags: [ "2026", "buildinpublic", "ai", "claude", "roots", "security" ]
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
