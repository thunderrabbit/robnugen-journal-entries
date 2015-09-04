---
title: hilariously bad security
tags: insecure
author: Rob Nugen
date: 2015-09-04T13:54:26+09:00
---

## 13:54 Friday 04 September 2015 JST

My message:

    ---- On Fri, 04 Sep 2015 00:37:50 +0200 do-not-reply@perfecthash.com wrote ---- 
    
    PerfectHash Support request from Thursday 03rd 2015f September 2015 10:37:50 PM 
    
    
    When trying to register, I tried to use a password including symbols: u$e#%5j9Q%s 
    
    I copied and pasted this password into the password and	password-verify fields, but I got the message
	"Please match the requested format", which a normal person won't understand, first of all, and second
	of all points to a bigger problem: 
    
    In your password validation system, you have pattern="u$e#%5j9Q%s" to see if the passwords match. 
    
    Obviously if you slap this into a regex thing, the pattern won't match because there's a $ which means end of string. 
    
    Anyway, I'm not sure I want to use your service if it cannot handle passwords properly. 
    

And their reply:

    Hello dear Investor
    
    Please do not use special characters and only numbers and letters are allowed.
    
    Please do not hesitate to contact us

 

 



Regards,
PerfectHash Customer Care


