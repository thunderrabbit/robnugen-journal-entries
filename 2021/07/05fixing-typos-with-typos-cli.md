---
title: "fixing typos with typos-cli"
tags: [ "typos", "travis", "cool", "thanks" ]
author: Rob Nugen
date: 2021-07-05T19:43:12+09:00
draft: false
---

By cleaning up my room today, I found out about
[typos-cli](https://github.com/crate-ci/typos).

I have just installed it via

    sudo apt install cargo
    cargo install typos-cli

Then adding this to `.bashrc`

    if [ -d "$HOME/.cargo/bin" ] ; then
        PATH="$HOME/.cargo/bin:$PATH"
    fi

I added it to `.profile` first (because `.bash_profile` does not
exist), but apparently `.profile` isn't being executed.

