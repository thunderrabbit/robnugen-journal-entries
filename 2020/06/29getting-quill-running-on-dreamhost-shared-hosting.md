---
title: "Getting Quill running on Dreamhost shared hosting"
tags: [ "quill", "micropub", "dreamhost", "slim" ]
author: Rob Nugen
date: 2020-06-29T09:52:35+09:00
draft: false
---

This entry assumes you use Dreamhost shared hosting, and are comfortable with
`git`,
command line,

My goal with all this is to allow myself to post from my phone
directly to my Hugo-powered static website.  I recently found
[Micropub](https://indieweb.org/Micropub) gets me a long way toward
that goal.

I was able to get some "stuff" posted via
[Aaron Parecki's Micropub client Quill](https://quill.p3k.io/) notes,
but I could not get the editor to work; it is apparently not sending
the token, which is pretty surprising.

I
[set up a new Dreamhost user](https://github.com/thunderrabbit/new-DH-user-account)
for the website https://quill.plasticaddy.com/

In addition to the instructions above, I had to set the **Web
Directory** to `quill.plasticaddy.com/public`

[![2020 june 29 quill setup dreamhost web directory](//b.robnugen.com/journal/2020/2020_june_29_quill_setup_dreamhost_web_directory.png)](//b.robnugen.com/journal/2020/2020_june_29_quill_setup_dreamhost_web_directory.png)

I cloned https://github.com/aaronpk/Quill and used my clone,
git@github.com:thunderrabbit/Quill.git in the instructions below.

On my DH server:

$ cd ~
$ git clone git@github.com:thunderrabbit/Quill.git quill.plasticaddy.com

I set up the config file and ready to go!

[![2020 june 29 quill config file](//b.robnugen.com/journal/2020/thumbs/2020_june_29_quill_config_file.png)](//b.robnugen.com/journal/2020/2020_june_29_quill_config_file.png)

Oh no, not ready to go.

[![2020 june 29 quill dreamhost slim application error](//b.robnugen.com/journal/2020/thumbs/2020_june_29_quill_dreamhost_slim_application_error.png)](//b.robnugen.com/journal/2020/2020_june_29_quill_dreamhost_slim_application_error.png)

    preg_replace_callback(): Allocation of JIT memory failed, PCRE JIT will be disabled.
	This is likely caused by security restrictions. Either grant PHP permission to
	allocate executable memory, or set pcre.jit=0

I am on shared hosting, so cannot likely grant PHP permission to
allocate exexutable memory. 

I determined which version of php file to edit with `php -v`

    PHP 7.2.30 (cli) (built: Apr 24 2020 01:29:53) ( NTS )

I can set pcre.jit to 0 by editing `~/.php/7.2/phprc`.  Just need to add the
last line:

    cat `~/.php/7.2/phprc`

    ; {{{ The following lines were automatically added by DreamHost
    zend_extension=opcache.so
    ; }}} That's all from DreamHost
    ; {{{ Rob adding pcre.jit=0 to get Quill running.  Thanks to https://stackoverflow.com/a/59579035/194309
    pcre.jit=0
