---
title: fun request
tags: [ "work" ]
author: Rob Nugen
date: 2017-02-03T18:55:54+09:00
---

## 18:55 Friday 03 February 2017 JST

    [2/2/17, 11:25:56 AM] caught-in-middle: Hi, I updated ticket #2978. Please check when you can.

ticket 2978:

    The code we gave you before doesn't display the page views correctly.
    Could you switch the code to this?
    
[![placeholder](//b.robnugen.com/journal/2017/work/thumbs/placeholder.png)](//b.robnugen.com/journal/2017/work/placeholder.png)

Uh, yeah that's not going to work.  `{{$article->title}}` is obviously a placeholder.

    [2/2/17, 12:20:07 PM] Rob Nugen: thank you.  I got it, but I need
        a little bit of time to test.  I need to change the part that says
        {{$article->title}} to be the actual article title.
    [2/2/17, 7:15:47 PM] caught-in-middle: Thank you for checking. Ok, hope it goes smoothly.
    [2/3/17, 10:35:18 AM] Rob Nugen: Okay I've moved this online



    [2/3/17, 12:13:38 PM] caught-in-middle: Thank you.
        But this code doesn’t work. It doesn’t display titles correctly.
        Didi you test this code?

[![google analytics screenshot](//b.robnugen.com/journal/2017/work/thumbs/google_analytics_screenshot.png)](//b.robnugen.com/journal/2017/work/google_analytics_screenshot.png)

    [2/3/17, 12:13:52 PM] Rob Nugen: yes
    [2/3/17, 12:14:29 PM] caught-in-middle: hmm could send us screenshot or something?
    [2/3/17, 12:14:58 PM] Rob Nugen: a screenshot of what?
    [2/3/17, 12:15:11 PM] caught-in-middle: some evedence
    [2/3/17, 12:16:08 PM] Rob Nugen: clients-website,com/rss_fb.php
    [2/3/17, 12:16:58 PM] Rob Nugen: all the titles are correct.
    [2/3/17, 12:17:15 PM] Rob Nugen: search for 'set', 'title' on that link and they are all there.
    [2/3/17, 12:23:51 PM] Rob Nugen: On the source of this page clients-website,com/ja/news/63...
	    all the titles are correct
    [2/3/17, 12:24:01 PM] Rob Nugen: I don't see php or fb_ anywhere on the source of the page.
    [2/3/17, 12:24:20 PM] Rob Nugen: I'm not sure how the screenshot you showed me saw the name of the variable.
    [2/3/17, 12:24:28 PM] Rob Nugen: do you know where the data is coming from on that screenshot?
    [2/3/17, 12:25:21 PM] caught-in-middle: That is a screenshot of google analytics.
    [2/3/17, 12:25:30 PM] caught-in-middle: google,com/analytics/web/?authuser=2#home/xyzyourmomwashere/
    [2/3/17, 12:25:43 PM] caught-in-middle: I don’t know if you can see the page
    [2/3/17, 12:25:54 PM] Rob Nugen: I can't, unfortunately,
    [2/3/17, 12:26:07 PM] Rob Nugen: is it only happening for that news?
    [2/3/17, 12:28:39 PM] caught-in-middle: Sorry I’m not sure. Boss left for lunch. I’ll Skype you when he’s back.
    [2/3/17, 12:28:51 PM] Rob Nugen: okay
    [2/3/17, 12:29:18 PM] Rob Nugen: I have to go out for a bit as well
    [2/3/17, 12:29:38 PM] Rob Nugen: if you need to call me feel free.  or via Skype you can call
    [2/3/17, 12:29:42 PM] caught-in-middle: Of course
    [2/3/17, 12:29:51 PM] caught-in-middle: Ok, thank you,
    [2/3/17, 12:30:08 PM] Rob Nugen: no worries
    [2/3/17, 4:06:20 PM] caught-in-middle: The reason why Boss has changed the code is to display the titles
	    correctly on Google analytics. If you haven’t check Google analytics, please create your account.
        There are many other companies trying to be able to check the page views of Instant articles on Google
		analytics. Please search references and FAQs.
	[2/3/17, 4:10:53 PM] Rob Nugen: I have a Google analytics account, but I don't have access to Client-website
		analytics.
    [2/3/17, 4:11:27 PM] Rob Nugen: In order to give myself access to Client-website analytics, I need to
	    change the tracking code, which will limit your access to see the analytics.
	[2/3/17, 4:12:34 PM] Rob Nugen: There may be a way for you to add my account to view your analytics,
		but I'm not familiar with how to administer that service.
    [2/3/17, 4:13:15 PM] Rob Nugen: I believe if you add rob@monkey.net then I'll be able to see them
    [2/3/17, 4:20:53 PM] Rob Nugen: I have access now; thank you
    [2/3/17, 4:23:05 PM] caught-in-middle: Could you test the code checking Google analytics?
    [2/3/17, 4:24:31 PM] Rob Nugen: Yes, but first  I don't know how to get the same report you sent as a screenshot this morning.
    [2/3/17, 4:24:40 PM] Rob Nugen: can you help me see the problem?
    [2/3/17, 4:31:03 PM] caught-in-middle: Of course.
    google,com/analytics/web/?authuser=2#realtime/borkborkcaptainspork
    [2/3/17, 4:31:26 PM] caught-in-middle: it’s client-website site - realtime - contents
    [2/3/17, 4:32:23 PM] caught-in-middle: Page titles of Instant articles are messed up

Ticket 2978

    On Google Analytics, I noticed these news items had title '{{$article->title}}' which matches the code suggested by Google, I guess
    
    /ja/news/63...
    /ja/news/62...
    /ja/news/64...
    
    Instead of waiting for more items to show up on Google Analytics,
    I went through all the published items on Facebook Instant
    articles page. The following items also had '{{$article->title}}'
    as their title

    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    List of titles of articles with incorrect analytics code
    
    I corrected all of the above articles manually on Facebook instant article page
    
    This item had title including 'php echo $fb_item_title;'
    
    /ja/news/65...
    
    I have also corrected this item. I believe the incorrect title must
    have been read by Facebook during the time I activated the update of
    the website.

Now, how to fix *that*, I don't know, but it kinda made me angry that
they were like "did you test the code?"  When it's clearly the case
they manually edited all those articles incorrectly.  I never deployed
code with `{{$article->title}}` in it.
