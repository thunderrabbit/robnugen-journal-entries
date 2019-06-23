---
title: kevin
tags: []
author: Rob Nugen
date: 2002-04-24
---

<title></title>
<p class=date>5:07pm CDT Wednesday 24 April 2002</p>

<p>Kevin is pretty amazing.  He's my technical-oriented boss, (as
opposed to Karla - I guess she would be my business-oriented boss) and
has been working with SAS for several years (15).</p>

<p>So anyway, I love the way he can use quirks of SAS to solve
problems that I see as impossible.  Here is the latest example:</p>

<pre>
%if %qsubstr(&&&use_var,1,4) = VARS %then %do...
</pre>

<p>Obviously this will cause a WARNING if the length of the value of
the variable name stored in use_var (&&& = 2 levels of indirection in
SAS) is less than 4.</p>

<p>How to solve this?  Determine the length of the thing and not
hardcode 4, right?  Well yes, but(!) in the context where this code
exists, I cannot use any other data steps to determine the length of
the value, and there are no macro functions to do it.</p>

<p>I was stuck.</p>

<p>But Kevin found a brilliant way to solve it, which amounts to
artificially lengthening the value at the point of the comparison (but
not changing its actual value):</p>

<pre>
%if %qsubstr(&&&use_var..xxxx,1,4) = VARS %then %do...
</pre>

<p>The two dots terminate the macro variable name, and the macro
variable name it resolves to.  Then the xxxx is appended to that value
at the moment of the substring comparison.  Perfect.</p>

<p><img src='/images/rob/wL-ROB.gif'/></p>

