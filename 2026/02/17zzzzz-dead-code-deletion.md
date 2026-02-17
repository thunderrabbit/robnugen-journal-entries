---
title: "Improperly Tested Dead Code Deletion"
tags: [ "Antigravity Voice Journal", "sleepy", "transcribed" ]
author: Rob Nugen
date: 2026-02-18T01:10:00+09:00
draft: false
---

<div class="note">Transcribed 18 Feb 2026 via my Antigravity Voice Journal</div>

#### Wednesday, February 18th, 2026, 1:10 AM

It's 1:10 a.m. on. Wednesday, February 18th, 2026. And I was just about to go to bed. But I realized that I. Had
improperly tested. Um, I. Well, I ran tests, but I realized I hadn't pushed. The changes to my live server yet. Um.
Because usually. All edit. Um, are uploaded automatically, but in the most recent case, there was a bunch of file
deletions of dead code. That do not get propagated to the server so? I had. The well, I'm working with anthropics
Claude, who determined that. The code was not used. I said, I go ahead and delete all the files. It deleted 12 different
files with, like, a total of like something like five thousand eight hundred lines of code went bye bye

Then. I ran the tests, and I was, like, yeah, you know, everything passed, then I was, like, oh, hang on. Uh, I need to
actually deploy without those files because they don't get deployed anyway. I just said all that. Anyway, the tests are
running. Now, everything's still passing. I do expect everything will pass, but this is just a little audio recording to
create a journal entry. And to capture my. Tired brain and. Current state of my art for using LLM to help with the AB
project.
