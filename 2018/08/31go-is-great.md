---
title: "Go is great"
tags: [ "golang", "go", "great", "wow", "first" ]
author: Rob Nugen
date: 2018-08-31T21:50:51+09:00
---

## 21:50 Friday 31 August 2018 JST

Wow [Go](https://golang.org/) is great.  The compiler doesn't let you
fuck around too much.  "Hey you're wasting variables!"  "Hey those are
different!"

I can imagine what Travis meant when he said if a Hakyll program
compiles, it probably works correctly.  Even with all the side effects
available in Go, I am *much* more confident that my code works than
with any PHP code.

Now I wanna rewrite my legacy PHP sites in Go.  Not gonna do it, but
the thought crossed my mind.

Anyway, in less than a day, I was able to create this TOML output file
that represents the data in Marble Track 3's YouTube account.

    [Videos]
      [Videos.-ZEerNH_ldU]
        VideoId = "-ZEerNH_ldU"
        Title = "Marble Track 3 construction Live Stream"
        Published = 2018-08-30T10:54:30Z
        Duration = 0
      [Videos.M2Mbu-6B_mY]
        VideoId = "M2Mbu-6B_mY"
        Title = "Marble Track 3 construction Live Stream: fifteen segments in outer spiral"
        Published = 2018-08-30T11:36:47Z
        Duration = 0
      [Videos.W6IQYjU-BLc]
        VideoId = "W6IQYjU-BLc"
        Title = "Marble Track 3: snake looking for a spot"
        Published = 2018-08-28T03:07:33Z
        Duration = 0

The duration is 0 on all of them because
[v3 of YouTube's API does not return durations](https://issuetracker.google.com/issues/35170788)
when getting all videos in a list.  I will add code to get the
durations sooner than later, because the whole reason to do this is to
automatically have the total Livestream duration be updated on
[Marble Track 3 website](https://www.marbletrack3.com/).


## 00:00 Saturday 01 September 2018 JST

Just two hours later (including dinner with Lin) and bingo I got the Durations as well.

    [Videos]
      [Videos.-2PIQFMPv0w]
        VideoId = "-2PIQFMPv0w"
        Title = "Marble Track 3: reversible guy reversed"
        Published = 2018-07-07T23:21:00Z
        Duration = 106000000000
      [Videos.-KjsYc4Mb5g]
        VideoId = "-KjsYc4Mb5g"
        Title = "Marble Track 3: skeleton arrives"
        Published = 2017-08-08T02:32:25Z
        Duration = 68000000000
      [Videos.-MAFLkqIpUw]
        VideoId = "-MAFLkqIpUw"
        Title = "Marble Track 3 construction Live Stream"
        Published = 2018-02-09T05:29:13Z
        Duration = 2632000000000

Not bad for my first day messing around with Go.

https://github.com/marbletracks/go-get-video-durations/blob/36426e31be42c7c16f7a6f1e705c1106a111a789/my_uploads.go
