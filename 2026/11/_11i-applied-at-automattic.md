---
title: "I applied at Automattic"
tags: [ "2026", "2026", "2026", "job", "automattic" ]
author: Rob Nugen
date: 2026-11-11T07:54:00+09:00
draft: false
---

## What’s motivating you to explore an engineering role at Automattic and why now?*

### We’d love to hear specifics — about how we work, what we build, or our creed — that make Automattic a good fit for you and your goals.

> Motivation to join a8c:

I love the open nature of the World Wide Web!  Ever since the Web started, I have endeavored to keep my part of the web friendly, tidy, and human-readable. I studied HTML with HTMLGoodies back when each of his pages had a cheeky title like "So you want to center your text, huh?" [1]. In those days, we wrote all of our HTML *by hand*!

On my website design ad from around 1997[2] I described my websites as "Hand made. the way nature intended"

One way I keep things human-friendly: I name my images with human readable directories and names if at all possible. I like to think that in 10,000 years, this can help serve as a Rosetta stone for future e-archeologists.

I've been a web developer for most of my professional life, working mostly in PHP (and MySQL) for the past 15 years. I've got personal and client websites written in PHP, nurturing some of them over the years from PHP 5.3 to now PHP 8+ for all of them.

> Why apply to a8c *now*?

The core answer: until a couple of days ago, I had no idea Automattic has such a human-centric mindset! Happy to see keywords like "Fully Remote" and PHP, I felt even more delighted reading your application process, ethos, flat org chart, values, including things I characterize as "say 'no' instead of breaking trust."  Plus everything is open source and ... *wait, what?  40+ offerings besides WordPress, including a 100 Year Website? Sign me up!*

Moreover, I have been working for a company in Japan since 2012 in a role that's nearing completion as I'm moving to Adelaide, Australia in mid 2027. My move to Australia prompted me to start a job search.

Until my recent job search, I had *NO* idea that Automattic tries carefully to keep humans first. I feel thrilled because I've been doing the inner work with MKP (ManKind Project) since 1997; In 2015, I established a men's group in Tokyo[3] because I have a need for heart-to-heart communication with others!

[1] https://web.archive.org/web/19970529013632/http://htmlgoodies.com/basics.html
[2] https://b.robnugen.com/mrlabs/mr-labs-big.jpg
[3] https://mkpjapan.org/

## Tell us about a project or piece of work you’re especially proud of

### What was your role, and what were you personally responsible for? What technical decisions, trade-offs, and challenges made it interesting, and how did you navigate them?

TL;DR: AI and I are building a bilingual client website and emailing the client in Japanese (which I don't speak at business level!).

A few years ago (pre-AI-era), I created a template[4] and process[5] for launching websites on Dreamhost (DH) Shared Hosting. I could spin up a new user and database on DH with a new (sub) domain in about an hour, and then begin manually working on the project in VSCode.

Starting with that template, I set up an efficient way to work with a Japanese client on a site I call `eli`: a cronjob runs every five minutes on my local machine, deterministically polling my email so it can download any message from that client. Once a message is downloaded (along with its attachments), the script pings me on Telegram. Then I can ask `eliClaude` to grab the email, translate it and use TDD to make the requested changes to the site. Plus, with the magic of AI, `eliClaude` produces up-to-date documentation for the site in two languages and formats. With AI support, the speed with which I can respond to customer requests is amazing, nigh impossible just a couple years ago for me as a solo code wrangler, especially while not able to speak Japanese at business level!

[4] https://github.com/thunderrabbit/new-DH-user-site
[5] https://github.com/thunderrabbit/new-DH-user-account

## How has AI changed your work — if at all?*

### Specifics about your workflow and tooling are more useful than general opinions about where AI is headed — including how you decide when to use AI and when not to.

In 1990, I made a game of "Dots and Boxes" in *Pascal*[6] for IBM PC. Last month, Anthropic was like "hey we'll give you $250 credit if you let us connect Claude Code with your Github account," I thought *certainly!* and found my old Pascal code waiting patiently in my Github account. I asked Claude to translate the code to run online; two minutes later, seeing the code come to life in its fabulous 16 color glory felt exciting! I was so happy to see my old game again that I made a two-player online version and published it on my site[7].  I have more game ideas so we kept going. In about a week, AI and I created a whole games website[8] including DOTS and some other games now playable over internet.

On my local laptop, I have N+1 tabs in my terminal with different agent harnesses geared to the project I work on in that directory. I say N+1 because at any given moment another idea will come up that I can quickly explore. I see lots of new ideas and possibilities coming available with AI; how do we stay focused??  If we can guide agents and guide ourselves to learn to work with AI tools in a good way, I think we will be better able to make the transition to a world with ubiquitous AI.

[6] https://github.com/thunderrabbit/dots-in-pascal
[7] https://www.robnugen.com/dots/
[8] https://games.chatforest.com/dots/

## What’s an idea, book, blog post, or talk that recently changed how you think about your craft?*

### What is it? How did it change the way you build, collaborate, or make decisions?

I've been listening to Peter Diamandis podcast [9] as they regularly speak about all the positive outcomes and reasons to be optimistic for our future; math and science are flourishing, expanding, and advancing faster and faster. We as humans will have more options to re-invent ourselves multiple times per lifetime, per year, per day?  Where does it end? We humans still have to breathe and our hearts still beat on the order of seconds but the tech will keep diving into the domain of femtoseconds as the loops get smaller as the abilities get larger.

I enjoy making technology work for humans, allowing humans more time to be creative and present with one another. I love living in this unprecedented shift in technology and want to continue guiding us in a good way.

[9] https://www.youtube.com/@peterdiamandis

## What’s a controversial or unpopular opinion you hold about software engineering, and why?*

### This could be about tools, practices, philosophies — anything where your take might challenge conventional wisdom. We’re interested in how you think, not whether we agree.

My possibly-controversial opinion: Database primary keys SHOULD NOT be `id`!  They should be `widget_id` or `whatever_id` based on the name of the TABLE itself.  We don't generally create TABLE `table` so why create PK `id`?  Naming the PK thoughtfully allows more legible queries, especially when joining many tables. e.g. ```SELECT `user_id`, `name` FROM `users` JOIN `logins` USING (`user_id`) WHERE `login_time` > NOW() - INTERVAL 12 HOUR```

## Is there anything else you’d like us to know?

### This is your space. Maybe there’s context about your background that doesn’t fit neatly into the questions above, something you’re working on that you’re excited about, a constraint we should know about, or just something you think would help us understand you better.

As I apply for this role, I am in Australia with an Australian number, so that is the number I've added at the top of the application here on greenhouse.io.  The Australian number will be valid until December 7th, 2026.   My WhatsApp number, however, is still my Japanese number.  I believe I'll be reachable on WhatsApp at my Japanese number until at least May 2027.

Though I have installed WordPress several times for myself and performed maintenance on various WP installations, I generally don't use WordPress for any non-blog-centric sites.  At one point I used WordPress for my personal journal; I now deploy my journal as a static site generated with Perl parsing Markdown files [10].

While reading everything I could, I found your Get Acquainted page [11] has videos from as recent as 2022. We're in 2026 now so I started looking for other videos to help you update the page, but there seem to be none past 2022. I'm curious as to why those videos are no longer being created, or are they just no longer public?

As soon as I submit this, I plan to play with WP[12] and make a plugin because I'm excited to get started with stuff.

[10] https://www.robnugen.com/journal/
[11] https://automattic.com/fieldguide/howdy/get-acquainted/
[12] https://lab.robnugen.com/wp/

## follow the instructions at

## Would you like to share any links to your work or relevant social media profiles?

### This could be a GitHub, LinkedIn, personal site, blog, specific projects  –  anything that helps us get to know you and your work better.

https://github.com/thunderrabbit/
https://www.robnugen.com/en/
https://www.linkedin.com/in/robnugen/

## How'd you find us? Other: Can you tell us more about the option you selected above?

### We'd love to know if you were referred by an Automattic employee, by a recruiter, or any other details you'd like to share about how you became interested in joining Automattic.

When I started my job search, Claude Code found a8c to be a good match based on how I've been working for the past couple of decades, so you might want to add "AI-agent" as an option for how people find a8c.

## Please indicate your salary expectation for this role.*

$135,000 / year

## You may request an alternative evaluation method by contacting Automattic at talent@automattic.com.
