---
title: "might try to set up Fossil on Dreamhost"
tags: [ "dreamhost", "fossil", "maybe" ]
author: Rob Nugen
date: 2018-04-15T11:30:53+09:00
---

## 11:30 Sunday 15 April 2018 JST


I found an article about
[setting up Fossil on Dreamhost](https://curiouser.cheshireeng.com/2016/07/05/fun-with-dreamhost-fossil/),
and may try to go through it today.

First, I will
[set up a new sub-domain and new user on Dreamhost](https://github.com/thunderrabbit/new-DH-user-account).

## 12:07

Done.  I recognize that I am using git on a server for Fossil, but am
going to ignore that for now.

Though the previous article compiled from source, it appears
[Fossil provides Linux binaries](https://www.fossil-scm.org/index.html/uv/download.html)
now.

Fill in the latest version number for ... below

    wget https://www.fossil-scm.org/index.html/uv/fossil-linux-x64-.....tar.gz
	tar xf fossil-linux-x64-.....tar.gz
	mkdir ~/bin
	mv fossil ~/bin/

And the I appended bin/ to the PATH by adding this to ~/.bash_profile

    export PATH=$PATH:~/bin/

## 12:35

I *just* read that the author of other article did *not* put it in
PATH, but I like to fool around on command line, so it's good for me.

Now, to see if I can access it via https as a CGI script

    mkdir ~/publicrepos
    cd ~/publicrepos/
    mkdir repooo
    echo world > repooo/hello.txt
    fossil init -A rob repooo.fossil

Note password for user `rob`.

    fossil open repooo.fossil
    fossil user default rob
	fossil add repooo/hello.txt
    fossil commit

I set up `.htaccess` in root of public webserver, `/home/USERNAME/domain.com/.htaccess`

    <Files repos>
      SetHandler cgi-script
    </Files>

I created `repos` in `/home/USERNAME/domain.com/repos`:  (In the file below, change USERNAME below to the username of your
account.)

    #!/home/USERNAME/bin/fossil
    directory: /home/USERNAME/publicrepos
    notfound: /404.html
    repolist

Oh cool it works!

[https://fossil.chatforest.com/repos/](https://fossil.chatforest.com/repos/)

## 09:49 Tuesday 17 April 2018 JST

Okay, now I have kinda figured out a system for adding my journal git
repo to fossil:

Move to my existing git repo on local machine:

    cd ~/journal

[Export git into a new Fossil repo](https://fossil-scm.org/index.html/doc/trunk/www/inout.wiki)

    git fast-export --all | fossil import --git journal.fossil

I think this will help me update the fossil repo again by creating
files to link the leaves and nodes of the two repos (or something)

    fossil export --git --export-marks ../journal.fossil.marks journal.fossil |    \
        git fast-import --export-marks=../journal.git.marks

And now after I `git commit` I can run this to get the latest into
fossil (I think)

    git fast-export --import-marks=../journal.git.marks  --export-marks=../journal.git.marks  \
        --all | fossil import --git --incremental --import-marks        \
        ../journal.fossil.marks --export-marks ../journal.fossil.marks journal.fossil

I was then able to scp the journal.fossil file to
[https://fossil.chatforest.com/repos/](https://fossil.chatforest.com/repos/),
then change the password for thunderrabbit from its default.

Now, how do I add the remote to my local Fossil so I can push changes
to it?

    fossil sync --ssl-identity ~/.ssh/fossil.chatforest.com ssh://USERNAME@fossil.chatforest.com/path/to/journal.fossil

And set up auto synchronization

    fossil set autosync
