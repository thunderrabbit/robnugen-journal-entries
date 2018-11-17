---
title: "check if password has been compromised"
tags: [ "password", "troyhunt", "security", "pwned" ]
author: Rob Nugen
date: 2018-11-08T13:18:12+09:00
---

##### 13:18 Thursday 08 November 2018 JST

I wanted to write a Bash script which would take a file with a list of
passwords and throw each one at Troy Hunt's collection of compromised
passwords.

I probably won't do it soon because I found a [bash one-liner which
checks to see if a password was compromised](https://medium.com/@monliclican/bash-one-liner-to-check-your-password-s-via-pwnedpasswords-coms-api-using-the-k-anonymity-method-a5807a9a8056).

I had to modify it slightly, but this line works on my Mac:

    echo "pass> "; read -s pass_str; sha1=$(echo -n $pass_str | tr -d '\n' | shasum); echo "Hash prefix: ${sha1:0:5}"; echo "Hash suffix: ${sha1:5:35}"; result=$(curl https://api.pwnedpasswords.com/range/${sha1:0:5} 2>/dev/null | grep $(echo ${sha1:5:35} | tr '[:lower:]' '[:upper:]')); echo "Count: ${result#*:}"
