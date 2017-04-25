---
title: oops and whew
tags: work
author: Rob Nugen
date: 2017-04-25T12:53:24+09:00
---

## 12:53 Tuesday 25 April 2017 JST

I left the AB DB backup process in testing mode (backup every hour, do
not clean up the files) and it killed the disk this morning and locked
up the server.

Thankfully, I was able to request support from AWS.  They called me
immediately and helped me dismount the flooded disk, remount it at
/mnt on a different server where I was able to clean up the disk, then
remount it on AB server and get the server running again.

As a result of some part of that process, the mysql server got a sad
and corrupted a DB table.  So then the mysql server could not write to
that table. Thank goodness AB noticed the problem quickly and I was
able to rebuild the table to get it working again.

Now I just need to copy 14 records from the mysql log to the table in
question, and everything will be as I hoped it would be this morning
at 9am when I hoped to start working on a different project.
