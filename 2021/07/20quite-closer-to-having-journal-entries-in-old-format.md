---
title: "Quite closer to having journal entries in old format"
tags: [ "journal", "calendar", "format", "perl" ]
author: Rob Nugen
date: 2021-07-20T01:30:08+09:00
draft: false
---

Nice nice nice

Tonight I got my old journal code working under the same username as
now runs my robnugen.com site.

As of now, my old journal setup may be seen at
https://temp.robnugen.com/cgi-bin/journal.pl

Also as of now, the final few entries were written in markdown, so
the journal.pl code does not know how to display them.

I found https://web-stage.metacpan.org/pod/Markdent::Parser which is
up to date, but I am too tired now to figure out how to install it,
much less use it.

#### 04:09 Tuesday 20 July 2021 JST

Tired.  Very happy Fred helped me with journal so much.  2 hours now
must sleep before 7:30am meeting yay

#### 09:14 Tuesday 20 July 2021 JST

I created several issues on the old journal code, mostly to fix the markdown.

I fixed a couple issues, including one I assigned to Fred and then
realized I know how to fix it.

I just about think we can skip installation of a full Markdown parser
and just do it with some Perl magic because I haven't used that much
markdown magic..

#### 09:44

For the past 30 minutes I have been trying to get the above changes
since this morning to be applied to the other repo, which has the same
file, but different repo history.

I tried `git format-patch` (oh that reminds me of another markdown
thing I need to do for backticks..)

But when I try to apply the patch to the other repo, it keeps saying

    [canyonville]$ git am 0001-what.patch
    Applying: what
    error: 2021/07/20quite-closer-to-having-journal-entries-in-old-format.md: does not exist in index
    Patch failed at 0001 what
    Use 'git am --show-current-patch' to see the failed patch
    When you have resolved this problem, run "git am --continue".
    If you prefer to skip this patch, run "git am --skip" instead.
    To restore the original branch and stop patching, run "git am --abort".

As best I can tell,
`2021/07/20quite-closer-to-having-journal-entries-in-old-format.md`
DOES exist in index.

#### 09:51 Tuesday 20 July 2021 JST

Just for completeness, here are the steps, starting from my local
machine:

`$ ssh bfr`

    Welcome to Canyonville, etc

`$ cd ~/barefoot_rob/content/journal`

`$ git pull`

`$ gitl`

    * 8b04cf52 (HEAD -> master, origin/master, origin/HEAD) And
    * 877c1e04 what
    * ce324b1c was
    * 8ae8e863 her
    * 328e21d5 response?

`$ cd ~/temp.robnugen.com/journal`

`$ git --git-dir=../../barefoot_rob/content/journal/.git format-patch -n ce324b1c`

`$ cat *.patch | git am`
