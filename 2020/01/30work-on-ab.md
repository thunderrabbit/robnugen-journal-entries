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

##### 16:49 Saturday 01 February 2020 JST

Headless browswer installed.

Because phantomJS is not longer updated, I installed lynx and downloaded the latest Selenium Server from https://selenium.dev/downloads/

    sudo apt install lynx
    lynx https://bit.ly/2TlkRyu
    sudo mv selenium-server-standalone-3.141.59.jar /usr/bin/selenium-server-standalone.jar
    sudo chown root:root /usr/bin/selenium-server-standalone.jar
    sudo chmod 0755 /usr/bin/selenium-server-standalone.jar

Downloaded ChromeDriver from wget https://chromedriver.storage.googleapis.com/79.0.3945.36/chromedriver_linux64.zip via downloads via https://sites.google.com/a/chromium.org/chromedriver/getting-started

    wget wget https://chromedriver.storage.googleapis.com/79.0.3945.36/chromedriver_linux64.zip
    sudo apt install unzip
    unzip chromedriver_linux64.zip
    sudo mv chromedriver /usr/bin/chromedriver
    sudo chown root:root /usr/bin/chromedriver
    sudo chmod 0755 /usr/bin/chromedriver


From https://gist.github.com/ziadoz/3e8ab7e944d02fe872c3454d17af31a5 and https://tecadmin.net/setup-selenium-chromedriver-on-ubuntu/

    sudo apt-get install default-jdk
    sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add
    sudo echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
    sudo apt-get -y update
    sudo apt-get -y install google-chrome-stable xvfb

Your server setup is ready. Start the Chrome via standalone selenium server using Xvfb utility.

    xvfb-run java -Dwebdriver.chrome.driver=/usr/bin/chromedriver -jar /usr/bin/selenium-server-standalone.jar

Then run tests

    codecept run webdriver
