---
title: "AB site progress"
tags: [ "ab", "work" ]
author: Rob Nugen
date: 2018-11-07T22:03:48+09:00
---

##### 22:03 Wednesday 07 November 2018 JST

I have been upgrading AB's PHP to the standards described in
[Paul Jones' Modernizing Legacy Applications in PHP](https://leanpub.com/mlaphp).
So far I am still in the Autoloading section, but have done nearly
half of the classes.  Almost all of the "data" classes are done, but
none of the search or factory classes are done.

(I put data in quotes above because I think that is just a name we
came up with ..  not sure if it has a meaning outside our project.)

But that is not why I am writing.  I was just reading Troy Hunt
talking about passwords and want to add the HIBP password check to the
site.  I am glad we do not really limit the passwords (much; we do
crop them at a few hundred characters, but I now know to not do that),
but I am not sure I can get buy-in to require everyone to have good
passwords.

I am thinking I will log if passwords have been cracked, but that may
be a security issue itself.  Not sure.
