---
title: "technical debt"
tags: [ "work", "bah" ]
author: Rob Nugen
date: 2018-04-13T16:37:48+09:00
---

## 16:37 Friday 13 April 2018 JST

I gotta figure out how to make the AB project go more smoothly.

* one: The system was designed to work with Customers logging in to the frontend, and Admin logging into the backend.
* two: A couple years ago, Admin asked if there is a way for SuperCustomers to log into the front end.
* three: I had to adjust the way people log into the site to allow
  them to be either Customers or SuperCustomers
* four: On the backend, I adjusted the way Inquiries were created
  because Customers and SuperCustomers will both need Inquiries
* five: Now I need to adjust the way Sets are created (Redmine ticket 3167) and I thought it would take 2 hours
* six: Oh crap it is taking way more than 2 hours to do correctly,
  because it affects how Customers are created, which is new, due to
  step 3

Fortunately, Nate understands, but it will take a while to do much
about it.
