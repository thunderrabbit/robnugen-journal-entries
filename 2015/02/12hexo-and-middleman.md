---
title: Hexo and Middleman
tags: [ "hexo", "middleman" ]
author: Rob Nugen
date: 2015-02-12T17:15:00+09:00
---

##17:15 Thursday 12 February 2015 JST##

Well, Hexo *looks* great without any modification, and handled my
journal directory without complaints...  but it's slowwww (with
entries spanning 23 years (and more to come after I port years
199-2004)).

Middleman had some complaints, and looks like ass, but it's fast!!!

I fixed the complaints (boo hoo the date in filename doesn't match the
date in frontmatter.  who fuckin' cares?  Use one to override the
other!), and I assume someone has written a theme or two for
Middleman.

The "calendar" add-on(?) doesn't show anything like a calendar; it's
just some year/month indices.  Mmmaybe I'll find something and
mmmmmmmmmmaaaayyybbbe I'll write something to do it.

Oh, and Middleman doesn't use the same markdown that I'm used to.  If
I put double tildes across text ~~like this~~, I like the
strikethrough markup.  But Middleman just renders the tildes.  Gotta
figure out how to tell it which markdown to use.

##22:17

[Fixed the strikethrough thing](https://forum.middlemanapp.com/t/markdown-strikethrough/1030) with [:redcarpet](https://github.com/vmg/redcarpet)

In `Gemfile`:

```
gem "redcarpet", "~> 2.3.0"
```

In `config.rb`:

```
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true, :strikethrough => true
set :markdown_engine, :redcarpet
```

