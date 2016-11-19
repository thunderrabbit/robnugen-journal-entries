---
title: I got hugo running on shared hosting
tags: hugo
author: Rob Nugen
date: 2016-11-19T18:16:21+09:00
---

## 18:16 Saturday 19 November 2016 JST

I spun up a Debian box on Amazon, installed git, lynx, go, and then compiled
hugo.

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install git-core
    sudo apt-get install lynx
    lynx https://golang.org/dl/
    sudo tar -C /usr/local/ -xzf go1.7.3.linux-amd64.tar.gz
    export GOPATH=$HOME/go
    export PATH=$PATH:/usr/local/go/bin
    go get -v github.com/spf13/hugo

I copied that to my shared host and it works, though it runs more
slowly than on my local box.

## 21:38 Saturday 19 November 2016 JST

Okay now messing with https://gist.github.com/thomasfr/9691385 to see
if I can get git hooks set up.
