---
title: "effin around with gatsby"
tags: [ "fust", "first", "mt3", "gatsby", "airtable", "hmmm" ]
author: Rob Nugen
date: 2019-02-14T20:17:37+09:00
---

##### 20:17 Thursday 14 February 2019 JST

A man named Fust has recommended a new stack for Marble Track 3:
Airtable as backend, Gatsby as frontend, and some other things I have
not heard of.  Actually I had not heard of Gatsby.

I have an old VirtualBox sitting around so I spun it up and loaded a
Gatsby demo.  It pooped out a bunch of deprecation warnings, so I am
loathe to really dig into this thing if it will be an ongoing battle
against a bunch of deprecations ongoing during the project, as well as
making the marble track itself.

    vagrant@sb:~$ npx gatsby new davad https://github.com/davad/gatsby-hampton-theme
    npx: installed 1417 in 34.61s
    info Creating new site from git: https://github.com/davad/gatsby-hampton-theme.git
    Cloning into 'davad'...
    remote: Enumerating objects: 156, done.
    remote: Total 156 (delta 0), reused 0 (delta 0), pack-reused 156
    Receiving objects: 100% (156/156), 745.81 KiB | 283.00 KiB/s, done.
    Resolving deltas: 100% (68/68), done.
    Checking connectivity... done.
    success Created starter directory layout
    info Installing packages...
    npm WARN deprecated babel-preset-es2015@6.24.1: 🙌  Thanks for using Babel: we recommend using babel-preset-env now: please read babeljs.io/env to update!
    npm WARN deprecated postcss-cssnext@2.11.0: 'postcss-cssnext' has been deprecated in favor of 'postcss-preset-env'. Read more at https://moox.io/blog/deprecating-cssnext/
    npm WARN deprecated circular-json@0.3.3: CircularJSON is in maintenance only, flatted is its successor.
    npm WARN deprecated browserslist@1.7.7: Browserslist 2 could fail on reading Browserslist >3.0 config used in other tools.
    npm WARN deprecated gulp-util@3.0.8: gulp-util is deprecated - replace it, following the guidelines at https://medium.com/gulpjs/gulp-util-ca3b1f9f9ac5
    error Command failed: npm install
    
    
      Error: Command failed: npm installvagrant@sb:~$ gatsby new my-project https://github.com/davad/gatsby-hampton-theme
    gatsby: command not found
    vagrant@sb:~$ npx gatsby new davad https://github.com/davad/gatsby-hampton-theme
    npx: installed 1417 in 34.61s
    info Creating new site from git: https://github.com/davad/gatsby-hampton-theme.git
    Cloning into 'davad'...
    remote: Enumerating objects: 156, done.
    remote: Total 156 (delta 0), reused 0 (delta 0), pack-reused 156
    Receiving objects: 100% (156/156), 745.81 KiB | 283.00 KiB/s, done.
    Resolving deltas: 100% (68/68), done.
    Checking connectivity... done.
    success Created starter directory layout
    info Installing packages...
    npm WARN deprecated babel-preset-es2015@6.24.1: 🙌  Thanks for using Babel: we recommend using babel-preset-env now: please read babeljs.io/env to update!
    npm WARN deprecated postcss-cssnext@2.11.0: 'postcss-cssnext' has been deprecated in favor of 'postcss-preset-env'. Read more at https://moox.io/blog/deprecating-cssnext/
    npm WARN deprecated circular-json@0.3.3: CircularJSON is in maintenance only, flatted is its successor.
    npm WARN deprecated browserslist@1.7.7: Browserslist 2 could fail on reading Browserslist >3.0 config used in other tools.
    npm WARN deprecated gulp-util@3.0.8: gulp-util is deprecated - replace it, following the guidelines at https://medium.com/gulpjs/gulp-util-ca3b1f9f9ac5
    error Command failed: npm install
    
    
    Error: Command failed: npm install

