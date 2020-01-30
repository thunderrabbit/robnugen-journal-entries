---
title: "work on ab"
tags: [ "ab", "work", "progress" ]
author: Rob Nugen
date: 2020-01-30T17:06:56+09:00
draft: false
---

I've gotten AB fully upgraded to Ubuntu 18 and have their web server
in a VPN with their RDS server only available from within the VPN.  I
have had Codeception doing acceptance tests with the PhpBrowser (which
can test non-Javascript stuff).  Yesterday I started to figure out how
to get WebDriver tests working.

Surprising to get *no* response from peeps on the Codeception chat (on
either Slack or Discord), but I was able to figure out what the docs
gloss over.

To create a second Acceptance Suite, copy `acceptance.suite.yml` to
another file.

    cp acceptance.suite.yml webdriver.suite.yml

Then when running tests, `codecept run webdriver` will give an error
saying there is no directory `webdriver`.

Create a directory `webdriver/` at the same level as the `acceptance/`
directory.

I was able to create a tests in the directory with

    codecept g:cest webdriver TestForWebDriver

`codecept run webdriver` should work.

Next is a simple matter of installing a headless browswer.  I am still
working on that.

