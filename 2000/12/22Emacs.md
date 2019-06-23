---
title: Emacs
tags: []
author: Rob Nugen
date: 2000-12-22
---

<title>emacs rules</title>
<p class=date>3:36am CST Friday 22 December 2000</p>

<p>I will be using "emacs convention" when writing this entry.  M-q
means hitting the Meta key (escape) and then pressing the letter q.

<p>Emacs rules.  While formatting the previous entry, I was using M-q
to format text.  This key runs the fill-paragraph command, which
essentially applies text wrapping to the paragraph.</p>

<p>For my examples, I will use the &lt;pre>&lt;/pre> element because
text in the &lt;p>&lt;/p> element is automatically word wrapped by the
browser.</p>

<pre>Okay, here is a line of text that goes on and on in a most blah blah blah fashion and really doesn't say anything but will be our guinea pig sentence for the rest of this writing.  Actually I need to get some longer words like circumlocusive and diminutive ones as the exceptionally diminutive words will not as easily allow emacs to display its amazing skillz which I have intentions of showing the reader.  This should be long enough I hope.
</pre>

<p>Following is the same line after using M-q on it:

<pre>
Okay, here is a line of text that goes on and on in a most blah blah
blah fashion and really doesn't say anything but will be our guinea
pig sentence for the rest of this writing.  Actually I need to get
some longer words like circumlocusive and diminutive ones as the
exceptionally diminutive words will not as easily allow emacs to
display its amazing skillz which I have intentions of showing the
reader.  This should be long enough I hope.</pre>

<p>What I found accidentally is that M-1 M-q justifies the text!

<pre>
Okay, here is a line of text that  goes on and on in  a most blah blah
blah fashion  and really doesn't say  anything but  will be our guinea
pig sentence  for the rest  of this writing.  Actually  I  need to get
some  longer words  like  circumlocusive and  diminutive  ones as  the
exceptionally  diminutive  words will not  as   easily allow  emacs to
display  its  amazing skillz which   I have intentions  of showing the
reader.  This should be long enough I hope.</pre>

<p>When I first noticed that emacs had justified the text, it took me
a few tries to discover what keys I had mistakenly pressed instead of
M-q.  In that process, I also hit M-1 M-q twice in a row and
discovered that emacs shifted the positioning of the extra spaces
within each line!

<pre>
Okay, here is a line of text that goes on  and on in  a most blah blah
blah fashion  and really doesn't say  anything but  will be our guinea
pig sentence for the  rest of this  writing.   Actually I need to  get
some   longer words like   circumlocusive and  diminutive  ones as the
exceptionally diminutive words  will not  as   easily allow emacs   to
display  its  amazing skillz which I  have  intentions of  showing the
reader.  This should be long enough I hope.</pre>

<p>This difference is subtle with these short words.  Okay, here are
some longer "words" and M-1 M-q applied to them different numbers of
times:</p>

<pre>
aaaaaaaaaaaaaaaaaa bbbbbbbbbbbb cccccccccccccccccc dddddddddddddd  eee
fff  ggg  hhh  iiiiiiiiiiiiiiiiiiii jjjjjjjjjjjjjjjjjjjj kkkkkkkkk  ll
mmmmmmmmmmm</pre>

<pre>
aaaaaaaaaaaaaaaaaa  bbbbbbbbbbbb cccccccccccccccccc dddddddddddddd eee
fff  ggg  hhh  iiiiiiiiiiiiiiiiiiii  jjjjjjjjjjjjjjjjjjjj kkkkkkkkk ll
mmmmmmmmmmm</pre>

<pre>
aaaaaaaaaaaaaaaaaa bbbbbbbbbbbb cccccccccccccccccc  dddddddddddddd eee
fff  ggg  hhh iiiiiiiiiiiiiiiiiiii  jjjjjjjjjjjjjjjjjjjj kkkkkkkkk  ll
mmmmmmmmmmm</pre>

<p>Okay, even I am totally bored by this now.  Just know that emacs
rules and I love it.</p>

<p>It's 4:03am</p>

<p><img src='/images/rob/wL-ROB.gif'/></p>

