---
title: "autocompletes in Atom"
tags: [ "atom", "autocomplete" ]
author: Rob Nugen
date: 2019-05-04T22:06:33+09:00
---

##### 22:06 Saturday 04 May 2019 JST

Fantastic!  [Atom](https://atom.io) has a pretty easy way to auto-complete my custom strings in markdown format.  I now can type `cs` and it will offer to autocomplete 'Caret Splitter' as `[Caret Splitter](/parts/caret-splitter/)`

Here is the first draft of `snippets.cson`, before expanding the URLs to their full selves (and save a redirect with each click).

    '.source.gfm':
      'Back Right Medium Landing Zone':
        'prefix': 'brmlz'
        'body': '[Back Right Medium Landing Zone](/p/brmlz)'
      'Bar Below Circle by Caret Splitter':
        'prefix': 'bbcbcs'
        'body': '[Bar Below Circle by Caret Splitter](/p/bbcbcs)'
      'Bearing':
        'prefix': 'bearing'
        'body': '[Bearing](/p/bearing)'
      'Below Lower Zig Zag Track':
        'prefix': 'blzzt'
        'body': '[Below Lower Zig Zag Track](/p/blzzt)'
      'Caret Splitter Backboard':
        'prefix': 'csb'
        'body': '[Caret Splitter Backboard](/p/csb)'
      'Caret Splitter Feeder Extension Reflection Second Stanchion':
        'prefix': 'csfer2s'
        'body': '[Caret Splitter Feeder Extension Reflection Second Stanchion](/p/csfer2s)'
      'Caret Splitter Feeder Extension Reflection Stanchion':
        'prefix': 'csfers'
        'body': '[Caret Splitter Feeder Extension Reflection Stanchion](/p/csfers)'
      'Caret Splitter Feeder Extension Reflection':
        'prefix': 'csfer'
        'body': '[Caret Splitter Feeder Extension Reflection](/p/csfer)'
      'Caret Splitter Feeder Extension':
        'prefix': 'csfe'
        'body': '[Caret Splitter Feeder Extension](/p/csfe)'
      'Caret Splitter Feeder':
        'prefix': 'csf'
        'body': '[Caret Splitter Feeder](/p/csf)'
      'Caret Splitter Right Hand Inner Side':
        'prefix': 'csrhis'
        'body': '[Caret Splitter Right Hand Inner Side](/p/csrhis)'
      'Caret Splitter Right Track':
        'prefix': 'csrt'
        'body': '[Caret Splitter Right Track](/p/csrt)'
      'Caret Splitter Rudder':
        'prefix': 'csr'
        'body': '[Caret Splitter Rudder](/parts/caret-splitter-rudder/)'
      'Caret Splitter':
        'prefix': 'cs'
        'body': '[Caret Splitter](/parts/caret-splitter/)'
      'Circle by the Caret Splitter':
        'prefix': 'cbtcs'
        'body': '[Circle by the Caret Splitter](/p/cbtcs)'
      'Decorative Walls after the Lowest Small-Medium Splitter':
        'prefix': 'dwatlsms"'
        'body': '[Decorative Walls after the Lowest Small-Medium Splitter](/p/dwatlsms")'
      'Eighth Placed Outer Spiral Support':
        'prefix': '8poss'
        'body': '[Eighth Placed Outer Spiral Support](/p/8poss)'
      'Fifth Placed Outer Spiral Support':
        'prefix': '5poss'
        'body': '[Fifth Placed Outer Spiral Support](/p/5poss)'
      'First Placed Outer Spiral Support':
        'prefix': '1poss'
        'body':  '[First Placed Outer Spiral Support](/p/1poss)'
      'First Snake-Installed Rail':
        'prefix': 'fsir'
        'body': '[First Snake-Installed Rail](/p/fsir)'
      'Fourth Placed Outer Spiral Support':
        'prefix': '4poss'
        'body': '[Fourth Placed Outer Spiral Support](/p/4poss)'
      'Front Left Medium Landing Zone':
        'prefix': 'flmlz'
        'body': '[Front Left Medium Landing Zone](/p/flmlz)'
      'Guides into Back Right Medium Landing Zone':
        'prefix': 'gibrmlz'
        'body': '[Guides into Back Right Medium Landing Zone](/p/gibrmlz)'
      'Left Side Small Landing Zone':
        'prefix': 'lsslz'
        'body': '[Left Side Small Landing Zone](/p/lsslz)'
      'Little Wiggly Track':
        'prefix': 'lwt'
        'body': '[Little Wiggly Track](/p/lwt)'
      'Lower Curver off the Lowest Small-Medium Splitter':
        'prefix': 'lcotlsms'
        'body': '[Lower Curver off the Lowest Small-Medium Splitter](/p/lcotlsms)'
      'Lower Zig Zag 2 ban top':
        'prefix': 'lzz2bt'
        'body': '[Lower Zig Zag 2 ban top](/p/lzz2bt)'
      'Lower Zig Zag 2 ban':
        'prefix': 'lzz2b'
        'body': '[Lower Zig Zag 2 ban](/p/lzz2b)'
      'Lower Zig Zag 3 ban base':
        'prefix': 'lzz3bb'
        'body': '[Lower Zig Zag 3 ban base](/p/lzz3bb)'
      'Lower Zig Zag 3 ban':
        'prefix': 'lzz3b'
        'body': '[Lower Zig Zag 3 ban](/p/lzz3b)'
      'Lower Zig Zag 3ban Upper Base Base':
        'prefix': 'lzz3bubb'
        'body': '[Lower Zig Zag 3ban Upper Base Base](/p/lzz3bubb)'
      'Lower Zig Zag Net':
        'prefix': 'lzzn'
        'body': '[Lower Zig Zag Net](/p/lzzn)'
      'Lower Zig Zag':
        'prefix': 'lzz'
        'body': '[Lower Zig Zag](/parts/lower_zig_zag/)'
      'Lowest Back Left Small Marble Curve':
        'prefix': 'lblsmc'
        'body': '[Lowest Back Left Small Marble Curve](/p/lblsmc)'
      'Lowest Largest Backtracking Chopstick':
        'prefix': 'llbc'
        'body': '[Lowest Largest Backtracking Chopstick](/p/llbc)'
      'Lowest Largest Backtracking Popsicle Stick':
        'prefix': 'llbps'
        'body': '[Lowest Largest Backtracking Popsicle Stick](/p/llbps)'
      'Lowest Largest U-Turn':
        'prefix': 'llut"'
        'body': '[Lowest Largest U-Turn](/p/llut")'
      'Medium Catcher Below Triple Splitter':
        'prefix': 'mcbts'
        'body': '[Medium Catcher Below Triple Splitter](/p/mcbts)'
      'Ninth Placed Outer Spiral Support':
        'prefix': '9poss'
        'body': '[Ninth Placed Outer Spiral Support](/p/9poss)'
      'Outer Spiral':
        'prefix': 'os'
        'body': '[Outer Spiral](/p/os)'
      'Right Side Small Landing Zone':
        'prefix': 'rsslz'
        'body': '[Right Side Small Landing Zone](/p/rsslz)'
      'Second Placed Outer Spiral Support':
        'prefix': '2poss'
        'body': '[Second Placed Outer Spiral Support](/p/2poss)'
      'Seventh Placed Outer Spiral Support':
        'prefix': '7poss'
        'body': '[Seventh Placed Outer Spiral Support](/p/7poss)'
      'Sixth Placed Outer Spiral Support':
        'prefix': '6poss'
        'body': '[Sixth Placed Outer Spiral Support](/p/6poss)'
      'Snake Plate Chopstick':
        'prefix': 'spc'
        'body': '[Snake Plate Chopstick](/p/spc)'
      'Snake Plate U Turn':
        'prefix': 'sput'
        'body': '[Snake Plate U Turn](/p/sput)'
      'Snake Plate U-Turn Berm':
        'prefix': 'sputb"'
        'body': '[Snake Plate U-Turn Berm](/p/sputb")'
      'Snake Plate U-turn Berm Bar':
        'prefix': 'sputbb'
        'body': '[Snake Plate U-turn Berm Bar](/p/sputbb)'
      'Snake Plate':
        'prefix': 'sp'
        'body': '[Snake Plate](/p/sp)'
      'The First Track':
        'prefix': 'tft'
        'body': '[The First Track](/p/tft)'
      'Third Placed Outer Spiral Support':
        'prefix': '3poss'
        'body': '[Third Placed Outer Spiral Support](/p/3poss)'
      'Triple Splitter Small Feeder Inner Bar Lower Support':
        'prefix': 'tssfibls'
        'body': '[Triple Splitter Small Feeder Inner Bar Lower Support](/p/tssfibls)'
      'Triple Splitter Small Feeder Inner Bar':
        'prefix': 'tssfib'
        'body': '[Triple Splitter Small Feeder Inner Bar](/p/tssfib)'
      'Triple Splitter Small Feeder Outer Bar Lower Support':
        'prefix': 'tssfobls'
        'body': '[Triple Splitter Small Feeder Outer Bar Lower Support](/p/tssfobls)'
      'Triple Splitter Small Feeder Outer Bar':
        'prefix': 'tssfob'
        'body': '[Triple Splitter Small Feeder Outer Bar](/p/tssfob)'
      'Triple Splitter Small Feeder':
        'prefix': 'tssf'
        'body': '[Triple Splitter Small Feeder](/parts/triple-splitter-small-feeder/)'
      'Triple Splitter':
        'prefix': 'ts'
        'body': '[Triple Splitter](/parts/triple_splitter/)'
      'Two Ends Chopped Off Triple Splitter':
        'prefix': 'tecots'
        'body': '[Two Ends Chopped Off Triple Splitter](/p/tecots)'
      'Upper Splitter off the Lowest Small-Medium Splitter':
        'prefix': 'usotlsms'
        'body': '[Upper Splitter off the Lowest Small-Medium Splitter](/p/usotlsms)'
      'the Lowest Small-Medium Splitter':
        'prefix': 'tlsms'
        'body': '[the Lowest Small-Medium Splitter](/p/tlsms)'
      'the Triple Splitter Small Marble Catcher':
        'prefix': 'ttssmc'
        'body': '[the Triple Splitter Small Marble Catcher](/p/ttssmc)'
      '円周螺旋':
        'prefix': 'os'
        'body': '[円周螺旋](/p/os)'
