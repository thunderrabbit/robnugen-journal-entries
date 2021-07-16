---
title: "fixing typos with typos-cli"
tags: [ "typos", "travis", "cool", "thanks" ]
author: Rob Nugen
date: 2021-07-05T19:43:12+09:00
draft: false
---

By cleaning up my room today, I found out about
[typos-cli](https://github.com/crate-ci/typos) via Travis' website.

I saw "typos" which immediately grabbed my attention.  I immediately
installed `cargo` then installed `typos-cli` to see what it would do
for my journal entries.

    sudo apt install cargo
    cargo install typos-cli

Then adding this to `.bashrc`

    if [ -d "$HOME/.cargo/bin" ] ; then
        PATH="$HOME/.cargo/bin:$PATH"
    fi

(I had added it to `.profile` first (because `.bash_profile` does not
exist), but apparently `.profile` isn't being executed.)

##### 21:20

Hundreds of typos found, including some false positives, some
intentional typos, and some typos written by guests.

Going through the list with Atom's git interface, everything was fine
until I tried to `git add` (via Atom GUI) a deleted file and a new file
(as `typo` had fixed a filename).  This cause Atom to come to a
crawl.  I even killed and restarted Atom but it is hella stuck.

git on the command line is responsive and working fine.  I am curious
as to what has happened here...

##### 21:51

Atom's git interface works fine in a different git repository.  For my
`~/journal` repo, Atom claims there is no repository at all.  It was
working there an hour ago.  Very strange.

Hmmm.

https://news.ycombinator.com/item?id=21142934

##### 14:45 Sunday 11 July 2021 JST

Unrelated to Atom getting bogged down by the changes, I have reverted
all typo fixes in my journal.  Let them be part of the journal; no
reason to pretend I knew how to spell back then or now.
