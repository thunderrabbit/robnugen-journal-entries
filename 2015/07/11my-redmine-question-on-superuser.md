---
title: my redmine question on superuser
tags: [ "redmine", "oops" ]
author: Rob Nugen
date: 2015-07-11T19:48:24+09:00
---

## 19:48 Saturday 11 July 2015 JST

[Redmine Q on
superuser](https://superuser.com/questions/939251/how-where-does-redmine-calculate-store-spent-time)
took more time to research and write than to just rewrite all the time
entries (there are 9), but fuckit; what if I had a million entries?
or a quadrillion? (*)


I logged several time entries to an issue in project A, but they
should have been logged to an issue in project B.

I tried using Redmine GUI to edit the time entries to be associated
with the correct issue, but (because they're in different projects?)
the edit was rejected with "invalid issue" or something.

So, I logged in to mysql and edited the log entries:

    update time_entries set project_id=40, issue_id=2645 where
    `issue_id` = 2643;

Issue 2645 now correctly shows the logged time entries, and the total
"Spent time"

Issue 2643 correctly does *not* show any time entries, but still shows
the old value for "Spent time"

I tried refreshing the page, logging off and on, even using a new
browser, but the value for Spent time persists in issue 2643.

I don't see a field named `spent_time` in TABLE `time_entries` or
anything that looks similar when searching for the field name in DB
`information_schema`.

    select * from columns where (column_name like '%spent%' OR
    column_name LIKE '%time%') and table_schema = 'redmine';

How can I tell Redmine to update the value for "Spent time" after
manually editing entries in TABLE `time_entries`?



(*) then I probably wouldn't be using Redmine correctly.