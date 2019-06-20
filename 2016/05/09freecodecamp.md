---
title: Free Code Camp
tags: [ "freecodecamp" ]
author: Rob Nugen
date: 2016-05-09T18:31:04+09:00
---

## 18:31 Monday 09 May 2016 JST

Man I haven't been in a journaly mood!  Been quite prolific on Free
Code Camp dot com; I'm up to exercise 289 or so now:
https://www.freecodecamp.com/challenges/sum-all-odd-fibonacci-numbers

I finished
https://www.freecodecamp.com/challenges/convert-html-entities and
https://www.freecodecamp.com/challenges/spinal-tap-case pretty
quickly, but I haven't submitted them yet; I'm waiting for tomorrow,
my busy day in case I don't have time to submit anything else.  That
will give me a 6 day streak, and apparently there's some kind of
reward.  It's so weird that I gaf about the reward, but I'm highly
curious as to what it may be!

Someone was recently saying that gamification of goals makes him stop
all further progress. I don't think that will happen to me, but we
shall see!

I'm looking forward to finishing enough stuff to get the
https://www.freecodecamp.com/challenges/claim-your-front-end-development-certificate

I've been using the following technique to do most of the recent
exercises:

    var ThingDoer = function() {
    
        var tdSecretVar, anotherSecretVar;
    
        this.publicMethod = function(param) {
            var result;
		
            // do something cool, perhaps with tdSecretVar and brethren
			
            return result;
        }
    
        return this;
    }
    
    
    globalTest() {
    
        var myThingDoer = new ThingDoer();
    
        return myThingDoer.publicMethod();
    
    }

