---
title: Python Journal
tags: journal
author: Rob Nugen
date: 2009-09-29T11:38:29+09:00
---

## 14 Sept 2016

Just found this README.TXT in a repo on robnugen.com.  Repo is now
moved to [github](https://github.com/thunderrabbit/some-old-bs-journal)

## 29 September 2009 JST

I'm Rob Nugen, and have kept a journal since 1987.  Before YouTube, before LiveJournal, before
"blog" was even a word, I started posting my journal online at
http://robnugen.com/cgi-bin/journal.cgi This was basically an index into a directory of files with a
structure like YYYY/MM/DDfilename.html It could handle digging down into the tree of files, but not
really jumping to adjacent directories.

In 1997 or so, my brother Fred helped me write a version which is now in use at
http://robnugen.com/cgi-bin/journal.pl It features a calendar on the side to navigate the journal
entries.  The system uses a script to scan through the directories and files to create the
calendars, then uses various regexii to display the correct calendars on the left when the reader
wants to read the journal

For the past couple of years, I've been wanting a new version which will include the concept of
logging in to allow comments, allow a better search system including tags, be open source, and be
database driven.

I'm not yet willing to let go of uploading the files to various directories; I know my step-dad
still uses the journal.cgi version, and I want to keep supporting him, therefore that.  Also, in
case the whole world crashes, I figure file system reading will be easier than database reading, but
that's based on my ignorance of how databases are stored; maybe it would be just as easy.  (I can't
imagine it would be easier).

To facilitate the open source aspect, I've created a new git repository for this system at
http://git.robnugen.com/php_file_journal.git/ I'm actually just now learning git ("fo realz" (I had
used it a bit before, but didn't really grok it.)) and this seemed like as good a test project as
any.

I have absolutely no code written yet, but I needed a file to test uploading to the git repository,
so I wrote this README.TXT It's 85% likely this project and repository will die here, but hopefully
not.

Hmmm.. having trouble getting directories figured out..
