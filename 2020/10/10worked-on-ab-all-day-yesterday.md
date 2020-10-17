---
date: '2020-10-10T06:32:54+09:00'
entry_title: 'worked on AB all day yesterday'
journal: 'https://robnugen.com'
posttype: journal
published: true
slug: worked-on-ab-all-day-yesterday
title: 'worked on AB all day yesterday'
---

Yesterday I pretty much worked on AB all day and logged about 6 hours of payable time.  The request is to fix the trend reports from timing out, as the historical data has gotten larger for the 9 years that we've run the project, doing a report over all of their historical data often times out.

So now I'm retooling the thing so that we have a class that keeps track of the progress of the report and runs one month at a time instead of trying to run everything at once.

Last night I got to the point where I was too tired to really think properly so I'm glad I went to bed instead of trying to push forward and making bad decisions while programming.

As I write this the next morning, there is uncommitted code on my local computer that is likely to get erased and written a new way.  Basically I started to expand one class to do the work but I actually think it's a different class that should be split.

Yeah, thinking about it now it's very clear that this new way is the right way to go.  Basically I was thinking that some trend reports would use the old system and some would use the new system, but realistically I do not need to keep any of the old code because all trend reports will use the new system.

I'm really enjoying being able to speak my journal entries into my phone.  I still haven't fixed it so it goes to my live server immediately but it's much better.

