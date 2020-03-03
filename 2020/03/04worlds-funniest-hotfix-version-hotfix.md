---
title: "World's funniest hotfix version hotfix"
tags: [ "oops", "versioning", "php", "programming" ]
author: Rob Nugen
date: 2020-03-04T07:52:00+09:00
draft: false
---

After making some optimizations, We discovered a weird problem with
prev/next buttons on AB's site.  I realized what the problem was and
remembered I had already put a bandaid on it before but forgot about
it when I made the optimizations.  I wrote the following note above
the function I had to fix.

    /**
     * populateIDsIfDNE
     *
     * Hey future smart person
     * Before you decide to optimize by lowering PREFERENCE_WINGSPAN_PREV_NEXT, thinking it will reduce the time
	 * when populating prev/next ids in TABLE `search_queries_backend_ids`, just remember we have to
	 * account for maintaining list offsets while editing the very list we are on.
     * Similar to the comment in commit 695aacfd96df0dbc1ff82af924c8e399249d656a
     * We have an offset problem for any given search if we get to the last id in TABLE `search_queries_backend_ids`
     *
     * Here are the steps that cause a problem:
     *
     * * load list of units to check https://ab/en/system/units/?outofdate=1
     * * view a unit in the list (at which time the prev/next units are saved in TABLE `search_queries_backend_ids`)
     * * save the unit as checked (whereby it will not show up in original search)
     * * (optional) click next and edit next unit
     * * (optional) click next and do not edit next unit
     * * LET の be the number of units edited during this process
     * * click next until we get to last offset (at end of PREFERENCE_WINGSPAN_PREV_NEXT)
     * * this triggers a reload of unit ids (during which any checked units will not be found because they no longer need to be checked)
     * * let ォ be $offset_of_current at that time
     * * Now in TABLE `search_queries_backend_ids`, the new first unit was the のth unit in the original list
     * * click [next unit] on unit edit page (goes to offset = PREFERENCE_WINGSPAN_PREV_NEXT in TABLE `search_queries_backend_ids`)
     * * discover units were skipped.  How many? Let's see.. オ+の!
     *
     * The オ の variable values might not be defined or used exactly as outlined above,
	 * but hopefully this explains the problem with short wingspans
     *
     * Good luck,
     * Rob
     * March 4th, 2020
     *
     */

After hotfixing the above problem, I got an email while running tests on AB

    PHP Notice:  Constant SITE_VERSION already defined in /var/www/ab/versions/2020-03-03-2223/prepend.php on line 3

Wait what?

I had to issue the following world's funniest hotfix version hotfix

    diff --git a/prepend.php b/prepend.php
    index 530e1ab9..13f25731 100644
    --- a/prepend.php
    +++ b/prepend.php
    @@ -1,6 +1,5 @@
     <?php
    -define('SITE_VERSION','4.5.9');
    -define('SITE_VERSION','4.5.9a');
    +define('SITE_VERSION','4.5.9b');

That is all.
