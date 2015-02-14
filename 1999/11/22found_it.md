---
title: found it
tags: 
author: Rob Nugen
date: 1999-11-22
---

I found it!  This is my beautiful description of what journal.cgi does: 
 
 It reads files in the /journal directory (and below) allowing users to read
 through various items.  It allows me to just write a journal entry and drop
 it into the pile; I don't have to update the index.  It uses CSS to give an
 aesthetically pleasing look to each entry with minimal HTML code written in
 each entry.  Also, it includes some fun logic to treat files with different
 extensions differently:  for .txt it prepends and appends &lt;pre&gt; tags.  .htm
 and .html files are simply regurgitated.  All .jpg .jpeg .gif are displayed
 as inline images.  Also, if no file parameter is given on the command line,
 it looks for any file with 'description' in its name.  If found, the file's
 contents are displayed.  Otherwise it will display the contents of the last
 file in the directory.  I am prepending the file names with two digits (the
 date) so the default action is to display the most recent file for the user
 to read.  Users can just bookmark a location and it's magically up to date.

 <a href="http://www.robnugen.com/cgi-local/journal.cgi?dir=1999/11">http://www.robnugen.com/cgi-local/journal.cgi?dir=1999/11</a>

Also today at work I found something else:  An add-on for MS Outlook that will
extract an attachment from an email.  I spent a week looking for one to do
it on the unix side.  Found it in 10 minutes on this side.

See ya!

- Rob

