---
title: Kims site
tags: []
author: Rob Nugen
date: 2002-12-10
---

<p class=date>9:07am PST Tuesday 10 December 2002</p>

<p>Much better this morning.  It was frustrating yesterday because I
couldn't see the actual error message to help direct my debugging
search.  Had to use a bunch of print() statements and an exit() to
debug the thing.</p>

<p>This morning I got past the bulk of the errors, basically they were
all file paths not being correct.</p>

<p>FTPd to his server, if I go pwd, I get /web/whatever/.  But
<em>actually</em> the path is like /users/site120/cks/web/whatever/.
Silly FTP configuration.</p>

<p>I used a perl script to figure out what the path was.</p>

<pre>
#!/usr/bin/perl
print "Content-type: text/html\n\n";
print "&lt;html> &lt;head>\n";
print "&lt;title>CGI Environment&lt;/title>\n";
print "&lt;/head>\n";
print "&lt;body>\n";
print "&lt;h1>CGI Environment&lt;/h1>\n";
foreach $env_var (keys %ENV) {
   print "&lt;B>$env_var&lt;/B> = $ENV{$env_var}&lt;BR>\n";
}
print "&lt;/body> &lt;/html>\n";
</pre>
