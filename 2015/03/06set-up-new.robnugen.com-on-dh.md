---
title: Set up new.robnugen.com on DH
tags: dh, site
author: Rob Nugen
date: 2015-03-06 21:02 JST
---

##21:02 Friday 06 March 2015 JST##

[Set up new domain on DH](https://gist.github.com/thunderrabbit/0cbbc016288478ec3e46)

## How I set up new sites on Dreamhost (shared hosting, not their new Dreamcompute)

From their panel -> Domains -> Manage Domains -> [Add Hosting to a Domain / Sub-domain](https://panel.dreamhost.com/index.cgi?tree=domain.manage&current_step=Index&next_step=ShowAddhttp&domain=)

fill in the blanks, including create a new user

Make sure the new user is a shell user at https://panel.dreamhost.com/index.cgi?tree=users.users

Create a new ssh key for the new site

    ssh-keygen

Enter the domain as the key filename

Move the keypair to `~/.ssh`

scp the public key to the new machine

ssh into the new machine and move the key to ~/.ssh

    mkdir ~/.ssh
    chmod 700 ~/.ssh

Move the public key to ~/.ssh/authorized_keys

    chmod 400 ~/.ssh/authorized_keys

Make `~/.bash_aliases` look like this:

    alias ls='ls --color=auto'
    alias gitd='git diff -b'
    alias gitl='git log --oneline --graph --decorate --all'
    alias gits='git status'

Append this to ~/.bash_profile`

    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    EDITOR=/usr/bin/emacs

    export EDITOR

Edit `.gitignore`:

    *~
    .cache
    logs/
    .ssh/
    .bash_history
    example.com

Set up git:

    git config --global core.excludesfile ~/.gitignore
    git config --global user.name "Rob Nugen"
    git config --global user.email rob@example.com

Log out of the new machine

On local machine:

Append something like the following to `~/.ssh/config`:

    Host example
        HostName example.com
        User example
        IdentityFile ~/.ssh/example.com

Now ssh into the site:

    ssh example

Enter password for the ssh key and you should be in.

## Fri Mar 6 22:32:43 2015 +0900

    commit 5a081754d37deaccc79ebb26144ebdc4a63f32e5
    Author: Rob Nugen
    Date:   Fri Mar 6 22:32:43 2015 +0900
    
        Can now use 'middleman deploy' to deploy to new.robnugen.com

And they say there will *never* be a hash collision on git, so I could
just write "woohoo! check out the meta data at git hash
5a081754d37deaccc79ebb26144ebdc4a63f32e5!" if there ever ends up being
a master list of all git hashes created.
