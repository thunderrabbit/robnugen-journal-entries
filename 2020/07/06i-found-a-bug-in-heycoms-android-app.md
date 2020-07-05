---
date: '2020-07-06T06:20:22+09:00'
entry_title: 'I found a bug in Hey.com''s Android app'
journal: journal
posttype: journal
published: true
slug: i-found-a-bug-in-heycoms-android-app
title: 'I found a bug in Hey.com''s Android app'
---
I found a bug in the text editor regarding cursor positioning.  It seems if I manually place the cursor somewhere and immediately start typing, the letters are inserted in the old cursor position until the server tells my client the new cursor position.

I think it is related to them auto saving encrypted messages.
