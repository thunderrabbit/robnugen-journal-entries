---
title: "New MT3 site design coming soon"
tags: [ "mt3", "website", "design" ]
author: Rob Nugen
date: 2019-01-11T22:28:51+09:00
---

##### 22:28 Friday 11 January 2019 JST

I wrote a post on Hugo forums to find a site designer who can make a
nice design for Marble Track 3.  As of this writing, the website uses
my tweak of Castanet, and looks like this
[Marble Track 3 site v2 (via archive.org)](https://web.archive.org/web/20190111132634/https://www.marbletrack3.com/)

Because the project takes some time to explain, I want the website to
quickly give people an overview, and allow people to click in to get
more details if they like.

One designer replied to my Hugo post.  We had a chat and this is their
first design iteration.
https://www.deligence.com/clients/marbletrack3/   I made a rough copy
here https://vigilant-mayer-608cf8.netlify.com/

One thing Jimmy noted was they used a hexagon motif where circles
would be more appropriate.  I spent a couple hours trying to reverse
engineer SVG paths

Thanks to https://svghelper.com/ for helping me create this shape

<svg xmlns="https://www.w3.org/2000/svg" width="400" height="200" version="1.1">
  <path  d="M360,55 L169,55 C58,55 108,10 24,10 H0 V119 H360 V75 Z"></path>
</svg>

I sent this response


    HI Sanjay
    
    Thank you for the design.
    
    I really like the video embedded in the header graphic, but it seems too dark to me; can it be made somewhat lighter color?
    
    I like that the site is responsive.
    
    Easy changes:
    
    1a) The VIDEO section should be directly below "These guys are great!
    Just look at them go!".  So please swap the order of OUR WORKERS to be
    below VIDEO
    
    1b) remove rectangle from around VIDEO section so it will seem
    connected to above text "Look at them go!"
    
    2a) In the TRACK (PARTS) section, the Made by sections should not have
    a space before the colon ("Made by: " is correct)
    
    2b) In the TRACK (PARTS) section, there should be no space before
    commas after workers names ("Dr Sugar, Mr McGlue, Squarehead" is
    correct)
    
    3) My friend made a rough logo that can replace the four circles logo.
    He will simplify it so it works at a small size
    
[![marble track 3 logo rough](//b.robnugen.com/art/marble_track_3/website/v2/thumbs/marble_track_3_logo_rough.jpg)](//b.robnugen.com/art/marble_track_3/website/v2/marble_track_3_logo_rough.jpg)
    
    Harder changes
    
    4) Please add a placeholder for the language selection.  There should
    be two languages for now: English and Japanese
    
    5) The hexagon theme doesn't make sense with the marbles; can the
    theme be round instead of hexagons?  Here are some examples of
    unnecessary hexagons, but there are many
    more. https://www.deligence.com/clients/marbletrack3/images/hexline_2.png

[![hexagon on worker image](//b.robnugen.com/art/marble_track_3/website/v2/thumbs/hexagon_on_worker_image.png)](//b.robnugen.com/art/marble_track_3/website/v2/hexagon_on_worker_image.png)
[![round instead of hexagons footer](//b.robnugen.com/art/marble_track_3/website/v2/thumbs/round_instead_of_hexagons_footer.png)](//b.robnugen.com/art/marble_track_3/website/v2/round_instead_of_hexagons_footer.png)
[![hexagons should be round](//b.robnugen.com/art/marble_track_3/website/v2/thumbs/hexagons_should_be_round.png)](//b.robnugen.com/art/marble_track_3/website/v2/hexagons_should_be_round.png)

    5 suggestion (easy change)) For the workers, perhaps above could be
    approximately this shape

[![smooth curve for workers](//b.robnugen.com/art/marble_track_3/website/v2/thumbs/smooth_curve_for_workers.png)](//b.robnugen.com/art/marble_track_3/website/v2/smooth_curve_for_workers.png)

    <svg xmlns="https://www.w3.org/2000/svg" width="400" height="200" version="1.1">
      <path  d="M360,55 L169,55 C58,55 108,10 24,10 H0 V119 H360 V75 Z"></path>
    </svg>

    6) Anchors in the top right for Twitter, Youtube, Github are too wide.
    The anchors overlap so that when mouse cursor is over Twitter anchor,
    the Youtube anchor is active.

[![anchors overlap and steal clicks from each other](//b.robnugen.com/art/marble_track_3/website/v2/thumbs/anchors_overlap_and_steal_clicks_from_each_other.png)](//b.robnugen.com/art/marble_track_3/website/v2/anchors_overlap_and_steal_clicks_from_each_other.png)

    7) FYI: The current site has no Javascript, so the new site should
    still work without javascript.  (no fancy graphics need without
    Javascript, but the site should work Web 1.0 if javascript is off)
    
    8) There are many errors in browser console.  Please remove or repair the broken code
    
    XML Parsing Error: not well-formed Location: https://www.deligence.com/clients/marbletrack3/index.html# Line Number 21, Column 70: index.html:21:70
    TypeError: MARBLE.initialize.masonry is not a function[Learn More] app.js:291:7
    init https://www.deligence.com/clients/marbletrack3/js/app.js:291:7 dispatch https://www.deligence.com/clients/marbletrack3/js/jquery.min.js:2:41720 add/y.handle https://www.deligence.com/clients/marbletrack3/js/jquery.min.js:2:39774
    TypeError: MARBLE.initialize.masonry is not a function[Learn More]
    app.js:299:7
    init https://www.deligence.com/clients/marbletrack3/js/app.js:299:7 dispatch https://www.deligence.com/clients/marbletrack3/js/jquery.min.js:2:41720 add/y.handle https://www.deligence.com/clients/marbletrack3/js/jquery.min.js:2:39774
    Source map error: SyntaxError: JSON.parse: unexpected character at line 1 column 1 of the JSON data Resource URL: https://www.deligence.com/clients/marbletrack3/css/bootstrap.min.css Source Map URL: bootstrap.min.css.map[Learn More]
    Source map error: SyntaxError: JSON.parse: unexpected character at line 1 column 1 of the JSON data Resource URL: https://www.deligence.com/clients/marbletrack3/css/bootstrap.min.css Source Map URL: bootstrap.min.css.map[Learn More]
    
    9) How do you plan to receive feedback from users?  This site will be
    hosted on Netlify.
    
    10) OUR WORKERS section should be dynamically generated so as I add
    more workers, they will show up on the top page in OUR WORKERS
    section.

    best regards
    Rob
