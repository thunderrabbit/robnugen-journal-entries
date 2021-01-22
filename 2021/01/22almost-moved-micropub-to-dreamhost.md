---
title: "Almost moved Micropub to DH"
tags: [ "almost" ]
author: Rob Nugen
date: 2021-01-22T11:33:53+09:00
draft: false
---

(written 11:33 Friday 22 January 2021 JST)

Getting back to my DH server.. In the instructions below, I am repeating paths to make each command more clear.  Anyway, here is what I did (basically):

1. Set up a [new Dreamhost user and stuff](https://github.com/thunderrabbit/new-DH-user-account)
2. Have [Dreamhost set up SSL via Let's Encrypt](https://panel.dreamhost.com/?tree=domain.secure).  Otherwise get "Invalid Self Sign Cert" error with Micropub.
3. Log onto the newly created server
4. set up new server's ssh keys on gitlab, github, and bitbucket so I can clone all the things via ssh not https
5. Create a directory of my hugo source files:  `cd ~; git clone --recursive   git@github.com:thunderrabbit/barefoot_rob.git`
6. Add Micropub server to my public directory of the website: `cd ~/www.robnugen.com; git@github.com:thunderrabbit/micropub.git`
7. `cd ~/www.robnugen.com/micropub`, then set up config.php
8. Install Hugo binary from gohugo.io
9. Give some place for Micropub to write files: Manually run the hugo command at the bottom of `config.php` to create the site in the public directory `www.robnugen.com`.  In my case, this is the command: `/home/barefoot_rob/bin/hugo --quiet --config /home/barefoot_rob/barefoot_rob/config.toml -s /home/barefoot_rob/barefoot_rob/ -d /home/barefoot_rob/www.robnugen.com/`
10. Set up Composer (officially requires VPS on DH)
11. `cd ~/www.robnugen.com/micropub; php composer.phar install; rm composer.phar`
12. I also copied changes to Micropub that were on my old machine but not yet ported to the new server.  Not sure how much of that was needed. 

Well, it is working via Quill but not for the text above. If I remove
some of the lines it works.  Have not figured out what is crashing
about the text above.