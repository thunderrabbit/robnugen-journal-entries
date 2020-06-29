---
title: "Getting Quill running on Dreamhost shared hosting"
tags: [ "quill", "micropub", "dreamhost", "slim" ]
author: Rob Nugen
date: 2020-06-29T09:52:35+09:00
draft: false
---

This entry assumes you use Dreamhost shared hosting (Ubuntu), and are
comfortable with `git`, command line, and maybe other stuff.

My goal with all this is to allow myself to post from my phone
directly to my Hugo-powered static website.  I recently found
[Micropub](https://indieweb.org/Micropub) gets me a long way toward
that goal.

I was able to get something posted via
[Aaron Parecki's Micropub client Quill](https://quill.p3k.io/) notes,
but I could not get the editor to work; it is apparently not sending
the token, which is pretty surprising.

I wanted to have a copy of the [Quill code](https://github.com/aaronpk/Quill) running on my own server so I
could see what was (not) happening.

I [set up a new Dreamhost user](https://github.com/thunderrabbit/new-DH-user-account)
for the website https://quill.plasticaddy.com/

In addition to the instructions above, I had to set the **Web
Directory** to `quill.plasticaddy.com/public`

[![2020 june 29 quill setup dreamhost web directory](//b.robnugen.com/journal/2020/2020_june_29_quill_setup_dreamhost_web_directory.png)](//b.robnugen.com/journal/2020/2020_june_29_quill_setup_dreamhost_web_directory.png)

I cloned https://github.com/aaronpk/Quill and used my clone,
git@github.com:thunderrabbit/Quill.git in the instructions below.

On my Dreamhost server:

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

Then I had to create the table manually by sending the contents of
the Quill schema file to mysql
https://raw.githubusercontent.com/aaronpk/Quill/master/schema/mysql.sql

As of this writing

    CREATE TABLE `users` (
      `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
      `url` varchar(255) DEFAULT NULL,
      `authorization_endpoint` varchar(255) DEFAULT NULL,
      `token_endpoint` varchar(255) DEFAULT NULL,
      `micropub_endpoint` varchar(255) DEFAULT NULL,
      `micropub_media_endpoint` varchar(255) DEFAULT NULL,
      `micropub_access_token` text,
      `micropub_scope` varchar(255) DEFAULT NULL,
      `micropub_response` text,
      `micropub_slug_field` varchar(255) NOT NULL DEFAULT 'mp-slug',
      `micropub_syndicate_field` varchar(255) NOT NULL DEFAULT 'mp-syndicate-to',
      `micropub_success` tinyint(4) DEFAULT '0',
      `date_created` datetime DEFAULT NULL,
      `last_login` datetime DEFAULT NULL,
      `last_micropub_response` text,
      `last_micropub_response_date` datetime DEFAULT NULL,
      `location_enabled` tinyint(4) NOT NULL DEFAULT '0',
      `syndication_targets` text,
      `channels` text,
      `twitter_access_token` text,
      `twitter_token_secret` text,
      `twitter_username` varchar(255) DEFAULT NULL,
      `email_username` varchar(255) DEFAULT NULL,
      `default_timezone` varchar(255) DEFAULT NULL,
      `supported_post_types` longtext,
      `supported_visibility` longtext,
      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

And it works!

Well, it's posting both notes and articles.  Now I just have to get my
copy of micropub to parse them the way I want.

##### 19:39 Monday 29 June 2020 JST

Been working pretty much all day on it, and beginning to get hold of
how to put the files where I want them to be.
