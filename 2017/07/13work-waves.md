---
title: work waves
tags: [ "work" ]
author: Rob Nugen
date: 2017-07-13T09:06:45+09:00
---

## 09:06 Thursday 13 July 2017 JST

ALTER TABLE  `frontend_appt_requests` CHANGE  `modified`  `modified` TIMESTAMP NOT NULL DEFAULT  '0000-00-00 00:00:00';

ALTER TABLE  `frontend_appt_requests` CHANGE  `created`  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ;

ALTER TABLE  `frontend_question_sets` CHANGE  `modified`  `modified` TIMESTAMP NOT NULL DEFAULT  '0000-00-00 00:00:00';

ALTER TABLE  `frontend_question_sets` CHANGE  `created`  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ;
