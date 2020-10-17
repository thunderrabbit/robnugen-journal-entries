---
date: '2020-10-11T00:06:56+09:00'
entry_title: 'worked on AB all day'
journal: 'https://robnugen.com'
posttype: journal
published: true
slug: worked-on-ab-all-day
title: 'worked on AB all day'
---

I've been working on an interesting augmentation of the AB website.  

I had already built AB a backbone powered JavaScript interface to allow building MySQL queries to run against the data.  They have been collecting data for a long time, so reports run over all that data tend to time out if they run complex queries over a great portion of their data.

Basically they would click go and the JavaScript would hand everything to the server to run in one giant swoop.

As of today, I've made a proof of concept that they click go and the JavaScript sends a report ID and the back end will run the next portion of the report and then send a signal back to the JavaScript to say it's done with that part, or with the entire thing.

So now the JavaScript happily counts up to the maximum number of portions and then stops when it's complete.

There is still several parts to fill in:

1. Allow downloading of the report when it's complete
2. Actually write the data to the report :-/
3. Save the number of output rows in the metadata
4. Correctly display the first page preview of the report

A bonus will be to allow clicking through the preview page by page.
