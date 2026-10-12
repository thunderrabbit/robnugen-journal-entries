---
title: "Made a resume site"
tags: [ "2026", "resume", "claude", "website" ]
author: Rob Nugen
date: 2026-10-11T22:12:00+10:30
draft: false
gdoc_id: journal-20261011-221253
---

#### 22:12

tl;dr: my resume has been cleaned up and is (still) available at
https://resume.robnugen.com/

Today after registering for a job search website in Australia,
I realized I needed to update my resume, which had lots of annoying
little CSS issues. So based on my [template](https://github.com/thunderrabbit/new-DH-user-site),
I had Claude make a whole new website
https://github.com/thunderrabbit/resume.robnugen.com/
which uses its database to store all of my resume data
that I've built over the years.

Though I don't know how much resumes are used anymore, the job site
wanted mine so I made this tool. If you use it, your actual resume
information is stored in the DB, not part of the code,
so your PII stays private.

When logged in as admin,
I can produce PDF versions of the resume based on the data
of any past year that I want to output.
I can even target it to different audiences by specifying
I should include topics related to
speaking or whatever.
