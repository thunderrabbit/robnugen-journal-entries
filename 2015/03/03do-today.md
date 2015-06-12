---
title: Do Today
tags: todo, today
author: Rob Nugen
date: 2015-03-03T10:43:00+09:00
---

##10:43 Tuesday 03 March 2015 JST##

Slightly different than other todo lists I've made, I will put time
limits on items today, during which I currently have 6 hours
available:

1. ~~check illustrations (1 hour)~~
1. ~~get Redmine to send emails (1 hour)~~
1. ~~create invoice from Redmine (1 hour)~~
1. ~~try to fix journal entries so unadulterated Middleman can use them (1 hour)~~

If I had a
[tomato timer](http://en.wikipedia.org/wiki/Pomodoro_Technique), I'd
count off 15 minute increments with it.  For now I'll use my phone.
(thanks to
[dropped knowledge](http://np.reddit.com/r/personalfinance/comments/2wyxua/someone_drop_knowledge_on_me_21mblackfl_i_want_to/covf6yp))

#10:48

Ready.. go!

#11:52

Finished illustrations!

#12:14

Ready.. go!

#12:30

Finished email fix!

#13:39

Finished invoice!

#14:26

Read reddit!  oops

#15:47

Took a bit more than an hour, but it looks like I've gotten my journal
entries tweaked for Middleman ('s glaring oversite?) regarding dates.

Basically, Middleman throws an exception if it encounters a date in
the frontmatter that differs than the date encoded in the file's path.

So if my file /2015/12/05monkey.md has a date of 1am December 6th, Middleman will barf.

Not only that, but Middleman can only handle one timezone for alllll
the entries, even though I've written entries and dated them while in
different timezones.  Bah.

BUT, Middleman was quite quick, so I adjusted my journal entries for
its sake.  The frontmatter dates don't matter (ahem) to me as much as
the file path dates and the dates actually written in the entries
themselves.
