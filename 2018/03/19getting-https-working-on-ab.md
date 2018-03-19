---
title: "Getting https working on AB"
tags: [ "ab", "work", "https", "certbot", "ssl" ]
author: Rob Nugen
date: 2018-03-19T15:43:36+09:00
---

## 15:43 Monday 19 March 2018 JST

Nice to see setting up SSL certificates for Apache 2 on Ubuntu is
pretty easy.  They even automagically set up a cron job to renew the
certificate after two months.  See `/etc/cron.d/certbot`

I had a problem for a minute because one .conf file had a domain and
an alias in it.  I ran certbot for the aliased domain and told it to
go ahead and force https, but then that broke the main domain (which
was the main domain) by forcing SSL *and* using the certificates for
the test domain.

So I split the .conf files into two different files (This is a
technique called WET (Write Everything Twice)) which might suck for
future me, but now AB is available via https.  Noice!

I'll write future me a note.

    Hey future Rob

    testadmin.ab.com exists as a separate file to ensure the correct SSL
    certificates are used for the domain.

    Feel free to wipe the domain from the map; I don't use it very often.

        past Rob
