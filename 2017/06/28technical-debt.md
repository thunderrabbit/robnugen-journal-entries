---
title: technical debt
tags: [ "work" ]
author: Rob Nugen
date: 2017-06-28T10:40:52+09:00
---

## 10:40 Wednesday 28 June 2017 JST

The old code was this:

    $search_id = uniqid(UserAuthentication::getUserId());

Now it is this.

    switch ($report_id) {
        case '2':       // I have no idea how to fix this one
        case '5':       // contact edit page knows nothing of V2-style indices
        case '9':       // contact edit page knows nothing of V2-style indices
        case '10':      // uses `u` in query.  See SELECT * FROM `defined_reports` WHERE `dr_id` = 10
        case '11':      // uses `t` in query
        case '13':      // can probably fix if remove `u` from `query` SELECT * FROM `defined_reports` WHERE `dr_id` = 13
        case '16':      // can probably fix if remove `u` from `query`
        case '17':      // can probably fix if remove `u` from `query`
        case '18':      // can probably fix if remove `u` from `query
        case '19':      // can probably fix if remove `u` from `query
            $search_id_version = 1;
            $search_id = uniqid(UserAuthentication::currentUserId());
            break;
        default:
            $search_id_version = 2;
            $search_id = "v2-" . uniqid(UserAuthentication::currentUserId());
            $search_id_existed = 0;
            break;
	}

I am actually pretty glad I put it in code instead of
the DB because now at least I have notes regarding why each one is
here, and I have a sense of where to start looking to fix them.

I guess I can do this:

    switch ($report_id) {
        case '2':       // I have no idea how to fix this one
        case '5':       // contact edit page knows nothing of V2-style indices
        case '9':       // contact edit page knows nothing of V2-style indices
        case '10':      // uses `u` in query.  See SELECT * FROM `defined_reports` WHERE `dr_id` = 10
        case '11':      // uses `t` in query
        case '13':      // can probably fix if remove `u` from `query` SELECT * FROM `defined_reports` WHERE `dr_id` = 13
        case '16':      // can probably fix if remove `u` from `query`
        case '17':      // can probably fix if remove `u` from `query`
        case '18':      // can probably fix if remove `u` from `query
        case '19':      // can probably fix if remove `u` from `query
            $search_id_version = 1;
            break;
        default:
            $search_id_version = 2;
            break;
	}

    $search_id = "v" . $search_id . "-" . uniqid(UserAuthentication::currentUserId());
    $search_id_existed = 0;

Because the version tester just looks for "v(%d)+-" at the beginning,
so old style uniqids like `115952d2ee60c79` and `v1-115952d2ee60c79`
will respond as type 1 ids.

.........

But I think really I am just losing my mojo for programming.
