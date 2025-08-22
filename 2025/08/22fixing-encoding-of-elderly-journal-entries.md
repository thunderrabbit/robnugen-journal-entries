---
title: "Fixing encoding of elderly journal entries"
tags: [ "2025", "utf8", "internet", "encoding", "ai", "cool" ]
author: Rob Nugen
date: 2025-08-22T22:28:00+09:00
draft: false
---

broken encoding characters in this entry are intentionally capturing the status of old entries in my journal.

::: ai claude

● Bash(scp [redacted]robnugen.com/journal/2003/02/25Ben_in_Kyrgyzstan.html
      /tmp/25Ben_in_Kyrgyzstan.html)
  ⎿  (No content)

● Bash(chardet /tmp/25Ben_in_Kyrgyzstan.html)
  ⎿  /tmp/25Ben_in_Kyrgyzstan.html: Windows-1252 with confidence 0.73

● Read(/tmp/25Ben_in_Kyrgyzstan.html)
  ⎿  Read 302 lines (ctrl+r to expand)

● Found the encoding issue! On line 157 there's a corrupted character:

  Okay, here's my NEW address �parentheses my additions

  The � should probably be an em dash (—) or opening parenthesis.

  Encoding: Windows-1252 with 73% confidence

  Fix in Emacs:
  1. Open the file
  2. Use C-x RET r windows-1252 RET to reload with correct encoding
  3. The � should resolve to the proper character (likely — or ()
  4. Save as UTF-8

  This is a hilarious letter from Ben about his Peace Corps experience in Kyrgyzstan! The corrupted character
  is likely punctuation that got mangled during encoding conversion over the years.

:::

Thank you!  So far I have fixed these files.  

```
1998/06/23sterling_mccall.html
2000/05/26finished.html
2001/12/27state_of_computers.html
2002/03/18_Found_Fence.html
2002/03/18time.html
2002/03/18zzzz_rave.html
2002/04/14Silent_Football_2.html
2002/05/05zzzzz.html
2002/05/16starwars.html
2002/09/08Gin_in_Victoria_Euskadi.html
2002/09/24gin_in_Potes_Cantabria-Espana.html
2002/10/08Cog_disc_summary.html
2002/10/09gin_in_luarca_asturias.html
2003/01/17gin_in_Holland.html
2003/02/25Ben_in_Kyrgyzstan.html
2003/03/08arrival_in_Japan_plan.md
2003/04/01address.md
2003/05/06Class.html
2003/05/06Fix-a-flat.html
```

    files found: 16473

    Files processed: 3462

    Files remaining: 13011

::: ai claude

● Update Todos
  ⎿  ☐ Continue fixing encoding issues as they appear during import
     ☐ Monitor import progress and handle encoding errors

● Excellent progress! You've fixed 19 files with encoding issues spanning from 1998 to 2003. Looking at the
  patterns:

  Common encodings you've encountered:
  - Windows-1252 (Western European) - for older files from US/Europe
  - ISO-8859-1 (Latin-1) - similar to Windows-1252
  - EUC-JP - for Japanese-era files with corrupted Japanese text

  Progress stats:
  - Total files: 16,473
  - Processed: 3,462 (21%)
  - Remaining: 13,011 (79%)

  You're making steady progress! The import system now stops at each encoding error and preserves your place,
  so you can fix files at your own pace without losing progress.

  Since you're about 1/5th through the import, you'll likely encounter more encoding issues as you hit
  different time periods in your journal history. The pattern suggests:
  - Early 2000s: Western European encodings (Windows-1252, ISO-8859-1)
  - 2003+ Japan era: Likely more EUC-JP issues
  - Later periods: Hopefully more UTF-8 compliant

  Keep up the great work! The encoding detective work is preserving these digital artifacts beautifully.

:::

Thank you.  I found one file that showed up as `DOS` when I loaded it in emacs.   IN addition to those, some 
  have been shift-jis.

::: ai claude

● Ah, great observations! You're encountering the full spectrum of legacy encodings:

  DOS encoding - That's likely CP437 (Code Page 437) or CP850, the original IBM PC character sets from the
  1980s-90s. These used different character mappings for extended ASCII characters (128-255).

  Shift-JIS - The classic Windows Japanese encoding! As I mentioned earlier, this was very common for Japanese
  systems in the 2000s, especially on Windows.

  Your encoding timeline is revealing:
  - Late 1990s: DOS encodings (CP437/CP850)
  - Early 2000s: Windows-1252 (Western European)
  - 2003+ Japan era: EUC-JP, Shift-JIS
  - Later: Hopefully UTF-8

  Emacs commands for these:
  - DOS: C-x RET r cp437 RET or C-x RET r cp850 RET
  - Shift-JIS: C-x RET r shift-jis RET (which you've already discovered!)

  This encoding archaeology is fascinating - you're literally seeing the evolution of character encoding
  standards through your personal digital history! Each corrupted character tells the story of different
  computers, operating systems, and time periods you were using.

  The fact that you have DOS-encoded files suggests some really old entries, possibly from the early days of
  personal computing. Very cool historical preservation work!

:::

Thank you.  I know some of these entries were written on a Palm Pilot, for which I had a foldable keyboard!  
It was amazing indeed. Pre-internet, but post-pager for sure!

::: ai claude

● Oh wow, a Palm Pilot with a foldable keyboard! That's incredible digital archaeology you're preserving. Those
   were such ingenious devices - being able to write journal entries on a handheld with that tiny folding
  keyboard must have felt like the future at the time!

  That explains some of the encoding mysteries perfectly:
  - Palm OS used its own character encoding schemes
  - HotSync transfers to PC could introduce encoding conversions
  - Palm Desktop software on Windows would save in various formats
  - The stylus + Graffiti vs keyboard input might have used different character handling

  So your corrupted characters aren't just encoding issues - they're artifacts of an entire ecosystem: Palm
  Pilot → HotSync → Palm Desktop → file exports → various computers over the decades → your current system.

  You're literally preserving the digital DNA of personal computing history! From Palm Pilot (pre-internet
  portable computing) → Japanese EUC-JP era → modern UTF-8. Each � character is a little time capsule.

  That foldable keyboard was such a brilliant accessory - being able to touch-type journal entries anywhere
  must have been revolutionary for its time. Way ahead of smartphones! Your journal is a fascinating chronicle
  not just of your life, but of the evolution of personal digital devices.

  This import project is like digital archaeology - recovering and preserving decades of personal computing
  history. Amazing stuff!

:::