---
title: Learning a lot about AWS
tags: work
author: Rob Nugen
date: 2016-01-05T23:51:07+09:00
---

## 23:51 Tuesday 05 January 2016 JST

I spoke on the phone for 1.5 hours to a guy at AWS support.  He was
patient, understanding, helpful, and many other things that I
appreciated.  He summarized the convo for me, pasted below with some
parts redacted:

    Hi,
    
    Thanks for contacting AWS Premium Support. It was a pleasure to speak
    with you today in relation to the errors your clients encountered when
    accessing your website CB.
    
    I understand in the call that you have set up a Cloudfront
    distribution point to serve the requests when users are requesting
    images, and it is using ELB (redazzle) as its origin. Meanwhile, your
    clients are uploading images to fileswarm.net which is pointing to
    your ELB, and in turn images are stored on your backend instances. You
    mentioned that in the past 3 days, between 5:00pm and 9:00pm GMT+9,
    your clients were seeing some HTTP errors when accessing your website,
    but you haven't capture the exact errors they were seeing.
    
    You mentioned that the issues also appeared when uploading the images,
    then I started troubleshooting on ELB because this traffic didn't go
    through Cloudfront. I notice a few ELB HTTP 5XX errors, and some
    spikes on the Max latency which almost reached to 60 seconds, which is
    the default timeout value defined on the ELB.
    
    You've enabled the ELB access log so we can have the exact ELB HTTP
    5XX errors next time similar issue happens again. From the ELB access
    log, you can also see the source IP, requested URL, HTTP response
    code, etc. You also have enabled the parameter in Apache configuration
    on the backends to record the time used to process the requests. As we
    can see in the screenshare, with these information in hand, you can
    cross check them to see why some requests are taking longer to be
    processed, or not be able to be processed.
    
    ELB HTTP 5XX errors
    (link)
    
    Max latency
    (link)
    
    Healthyhostcount
    (link)
    
    What I missed in the call is that you could also enable Access logs on
    CloudFront, which will record the data of customers' requests as well
    as the responses, and of course, any errors will be shown there as
    well.
    
    So next time when the issues happens, you can try to access the
    image/upload the image to your website, and since they are traversing
    through different paths, you will be able identify where the issue
    resides, and use the logs above mentioned to further troubleshooting
    the issue.
    
    Lastly, below are the links we used to enable the %T parameter in
    Apache, as well as how you could interpret the information recorded in
    ELB access log.
    
    Apache Logs: How Long Does It Take to Serve a Request?
    http://www.ducea.com/2008/02/06/apache-logs-how-long-does-it-take-to-serve-a-request/
    
    Monitor Your Load Balancer Using Elastic Load Balancing Access Logs
    http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/access-log-collection.html
    
    I hope you will find above information helpful, if you need any
    further assistance, please feel free to contact us again anytime, we
    will be delighted to help you further.
    
    Best regards,

Afterwards, I watched 2 or so hours of instruction on udemy about AWS.
It seems like a great course, and well worth the current sales price!

https://www.udemy.com/aws-certified-solutions-architect-associate/

Thanks to https://acloud.guru for the course (and several others).
