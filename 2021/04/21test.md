---
title: test
author: 'Rob Nugen'
location: 'geo:36.03058,139.37445;u=65'
date: '2021-04-21T05:41:17+09:00'
---

Seems I cannot post from Quill on my computer          

Nevermind.. this worked. I don't know what is happening.

#### 24 April

I think the problem started when I destroyed my journal directory when I used --remove-remote-file with `rsync`.  oops.  Should be all clear now.

I used `rsync` like that because I have a bash scripting issue.

Quill writes journal entries and puts them on my server in the repo that Hugo uses to build my site.

One of the child scripts is `untracked_remote_journal_file_getter.sh`.

For each file in the repo directory but *not* committed in the repo, it copies a remote file locally, then if that is successful, it moves the remote file to another location (on the remote server) just for safe keeping.  Each of these does an ssh keypair negotiation.

https://bitbucket.org/thunderrabbit/robnugen-journal-entries/src/264e9135211b3472344be5bca30c66bd4f247ece/untracked_remote_journal_file_getter.sh

Because it loops through files one by one, after processing three files this way, all the ssh keypair requests make the server say ダメ and kills my access for a few minutes.

So I need this script to work in batch mode.

Instead of looping on line 13, I need it to grab all the files at once.
Actually maybe the line 13 loop should be there to create local directories (line 14) and then do line 15 in batch mode.

This says I can put the files into double quotes

https://stackoverflow.com/a/21110306/194309

I will try that soonishly.
