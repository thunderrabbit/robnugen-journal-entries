---
title: "new code matching old code"
tags: [ "code", "ab", "comments", "news" ]
author: Rob Nugen
date: 2021-07-22T10:38:47+09:00
draft: false
---

(written 10:38 Thursday 22 July 2021 JST)

    ## 2021 July 22: While replacing singleton \UserAuthentication with a non-singleton...
    ##   This is written to match old code.
    ##   "line 2" below was the default value inside \Data\FrontendSnackRequestsのsetRockerId.
    ##   I hope $potter_id always has a value from "line 1" below.
    ## I am not sure when $potter_id would not have a value from "line 1" below.
    ## Even if an orchid uses this, the potter_id should get a value
    ## Anyway, lines 1-4 make this work like the code before this change
    $potter_id = \UASingleton::getInstance()->currentUser()->getPotterId();  # line 1
    $rocker_id = \UASingleton::getInstance()->currentUser()->getRockerId();  # line 2
    $use_potter_id = $potter_id ? $potter_id : $rocker_id;                   # line 3
    $frontend_snack_request->setRockerId($use_potter_id);                    # line 4

    #++++  just to be clear, this is the preferred line instead of the lines 1 - 4 above:
    #+++++ N.B. change this line like line 1 above when replacing UASingleton with non singleton UserAuthentication again
    #+ $frontend_snack_request->setRockerId(\UASingleton::getInstance()->currentUser()->getPotterId());
    #++++  end preferred line to replace all the 2021 July 22 comments and code

    ##  Thank you.
    ##  - Rob from 21 July 2022
    ##    JB水 will end after 4 more times at end of August
    ##    COVID 19 vaccines are semi rolling out
    ##    50C recently near Vancouver
    ##    major floods in China and Detroit
    ##    Tokyo Olympic 2020 games just starting ("Olympic bubble" yeah right)
    ## END changes from 2021 July 22
