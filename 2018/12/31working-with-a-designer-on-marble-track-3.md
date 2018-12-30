---
title: "working with a designer on Marble Track 3"
tags: [ "mt3", "design", "first", "sanjay" ]
author: Rob Nugen
date: 2018-12-31T03:57:19+09:00
---



##### 21:14 Sunday 30 December 2018 JST


    Dear Rob,
     
    
    Glad to see you email. I have gone through the website and there
    are a lot of improvement which can be done. Please check one of
    our Hugo based website - https://www.nathanaherne.com – If you’ll
    see on Home page – we have shown important section of the site
    briefly and with pictures. Same I’ll propose for this website
    i.e. we can show 3 or 6 Workers with Images, 3-6 Tracks, One Step
    with picture.
     
    
    Also, the concept of the site is totally different and unique – we
    need to put few lines to let the visitors understand what the site
    is all about. We need to create a good logo as well. Regarding
    Support/Donations, we need to create multiple ‘Call to Action’s to
    take the visitors to the support page.
     
    
    Do let me know your thoughts on my initial comments and do let me
    know if you are available for a video call on 3rd or 4th Jan? My
    Skype id is sanjay.deligence
    
     
    
    Thanks & Regards,
    
    Sanjay Kumar | CEO
    
    Deligence Technologies - your growing technology partner


##### 03:57 Monday 31 December 2018 JST

My replies, (poorly formatted here on my site):

    HI Sanjay
    
    Thank you for your email.  I am glad you looked at the same
    carefully enough to know it is a completely unique project.  I
    agree with the changes you have suggested so far.
    
    Here are some more sections of the site I would like to be considered:
    
    Episodes
    There is one more set of pages you should see as well.  https://www.marbletrack3.com/episode/   This page is hidden from normal visitors.  I would like the design of this page to match the rest of the site, but I do not want the page to be linked from the menus.
    
    Episodes are driven with the file at
    https://github.com/marbletracks/marbletrack3.com/blob/master/data/playlists/knownvideos.toml
    This file is updated with calls to Youtube API, driven by this
    script https://github.com/marbletracks/go-get-video-durations
    
    I am very happy with the way this all works.  I only want to
    redesign the /episodes page to match the rest of the site.
    
    Parts / Workers Did you see how these pages are linked between
    Workers and Tracks?  For example,
    https://www.marbletrack3.com/parts/caret_splitter_feeder_extension/
    source code includes an array of Workers that worked on the track.
    There will be many many more tracks to come, and I eventually need
    a way to allow human fans/supporters of the project to suggest
    names of parts.
    
    Thanks There will eventually be many more pages available under
    https://www.marbletrack3.com/thanks/ There are no pictures of
    people here yet, but this section is to thank the people who have
    helped me with the track.  The Sweets Party Attendants have helped
    me with translations.  Two more people have helped financially,
    but I do not have images / permission to show them on the site.  I
    would like a page under /thanks/ to be for this general support.
    
    Steps Under "Step by Step" https://www.marbletrack3.com/snippets/
    my idea is not nearly finished.  If you click the first Step you
    see this page,
    https://www.marbletrack3.com/snippets/0010_setting_the_stage/ The
    Step is a detailed description of the first video snippet in this
    playlist
    https://www.youtube.com/watch?v=-KjsYc4Mb5g&list=PL0osPGt21FB48UwuhtCUoi9JndC9YDHAZ
    
    In order to drive this part of the site, I want to create a data
    file similar to

    I have sketched out a file at
https://github.com/marbletracks/marbletrack3.com/blob/master/static/track_listing.txt

    but I have not written a way to parse it nor easily populate it.
    There is no way to automatically create this data file, so I need to
    have a reliable way to manually add new sections to it.
    
    I would like for each written Step to be linked to the
    corresponding second of output video.
    
    This line
    
    0:32 "candy_mama" | Snake Plate Chopstick for now, will create
    text on the site for Snake Plate Chopstick and link it to second
    32 of the correct video https://youtu.be/2bP7Irt5hHc?t=32
    
    I imagine this is a mini-project of its own, so I do not mind if
    we do not work on it.  But I am open to questions, ideas, and
    suggestions for it.
    
    In General For this project
    
    I would like all work to be done in the open with Pull Requests on
    Github.  I want all changes to work with my current workflow: when
    I git push changes to the site, they appear on the live site via
    Netlify.  I understand you do not have access to my Netlify
    account.  But I hope once I merge a pull request, it will work
    that way.  We can start with small changes to make sure it works
    in a way that is good for both of us.
    
    blessings
	- Rob


A few minutes later

    HI Sanjay
    
    I have just realized I sent my email before speaking about
    https://www.nathanaherne.com/
    
    You said "we have shown important section of the site briefly and with
    pictures."  Instead of pictures, I want to use video clips like the
    ones I have at the bottom of my existing
    site. https://b.robnugen.com/art/marble_track_3/workers/snippets/quick_look_francois_installs_stage.mp4
    
    The overall idea on Nathan's site is good, but Marble Track 3 site
    must focus on the workers and not focus on me as doing the work.  I
    will be semi-hidden from the project, only visible on /episodes and
    git repository.
    
    
    thank you
    Rob
