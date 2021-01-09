---
title: "Audacity waveform (audio track) not working"
tags: [ "audacity", "linux", "waveform" ]
author: Rob Nugen
date: 2021-01-09T12:53:17+09:00
draft: false
---

Using Audacity 2.3.3 on Pop!_OS 20.04, the waveform viewer has stopped working.

Playback and edits(*) are okay, but the waveform doesn't get updated properly to reflect the edits, highlights, zoom in/out, or scrub audio, whether by mouse or keyboard.  

I believe it started when I had to hard power-off my laptop when it froze.

Upon restarting after that power-cycle, Audacity offered to clean up orphaned files which it said were "small and unrelated to the current project" or something to that effect.

*edits = I can record audio and can (cut highlighted audio via scissors button)

To troubleshoot, I have

1. uninstalled Audacity 2.3.3
2. removed my data folder via `rm -rf .audacity-data/`
3. reinstalled Audacity 2.3.3
4. uninstalled Audacity 2.3.3
5. `sudo apt autoremove`
6. removed my data folder via `rm -rf .audacity-data/`
7. installed Audacity [b]2.4.2[/b].

But the problem remains, for either version.  

I installed each version as a <del>.deb file</del> <ins>flatpack</ins>
from Pop!_OS Pop Shop.  (I have not tried installing either of them as
a <del>flatpack</del> <ins>via command line</ins>, which I might try after posting this.)


[![2021 jan 09 audacity 2.4.2 waveform extreme](//b.robnugen.com/journal/2021/such_audacity/thumbs/2021_jan_09_audacity_2.4.2_waveform_extreme.png)](//b.robnugen.com/journal/2021/such_audacity/2021_jan_09_audacity_2.4.2_waveform_extreme.png)
[![2021 jan 09 audacity 2.4.2 waveform zoom in](//b.robnugen.com/journal/2021/such_audacity/thumbs/2021_jan_09_audacity_2.4.2_waveform_zoom_in.png)](//b.robnugen.com/journal/2021/such_audacity/2021_jan_09_audacity_2.4.2_waveform_zoom_in.png)
[![2021 jan 09 audacity 2.3.3 waveform](//b.robnugen.com/journal/2021/such_audacity/thumbs/2021_jan_09_audacity_2.3.3_waveform.png)](//b.robnugen.com/journal/2021/such_audacity/2021_jan_09_audacity_2.3.3_waveform.png)
[![2021 jan 09 audacity 2.4.2 waveform highlight](//b.robnugen.com/journal/2021/such_audacity/thumbs/2021_jan_09_audacity_2.4.2_waveform_highlight.png)](//b.robnugen.com/journal/2021/such_audacity/2021_jan_09_audacity_2.4.2_waveform_highlight.png)
[![2021 jan 09 audacity 2.4.2 waveform zoom out](//b.robnugen.com/journal/2021/such_audacity/thumbs/2021_jan_09_audacity_2.4.2_waveform_zoom_out.png)](//b.robnugen.com/journal/2021/such_audacity/2021_jan_09_audacity_2.4.2_waveform_zoom_out.png)

##### 13:17 Saturday 09 January 2021 JST

Before posting, I checked https://manual.audacityteam.org/ to
doublecheck the word "waveform" but it turns out they are called
"audio tracks" in Audacity.
https://manual.audacityteam.org/man/audio_tracks.html

Searching again, I found [Audacity 2.3.3 track display area not
updating on
Linux](https://forum.audacityteam.org/viewtopic.php?f=48&t=113597)
which at the very bottom suggests if I remove `~/.xinputrc`, that will
solve it.

    $ cat ~/.xinputrc 
    # im-config(8) generated on Sat, 02 Jan 2021 12:47:27 +0900
    run_im xim
    # im-config signature: 3a4bfe2e919afd2d677c1c2f43f9a8aa  -
    $ rm ~/.xinputrc

I uninstalled and reinstalled Audacity 2.4.2 and the audio track is
diffrent but not fixed.

I also `unset GTK_IM_MODULE` which had the value `xim` before,   but
even after doing that, uninstall and reinstall Audacity flatpack does
not show the audio track correctly.
