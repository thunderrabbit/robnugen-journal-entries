---
title: "Thank you for attending live"
tags: [ "live" ]
author: Rob Nugen
date: 2020-11-07T21:19:10+09:00
draft: false
---

As a special thanks to those who attended the livestreams, 10,000 yen
per month for as long as you wish to attend [Weekly Alignment](/weekly-alignments/)
sessions.  :-)

<div id="paypal-button-container"></div>
<script src="https://www.paypal.com/sdk/js?client-id=AYGyweHrSQT_sPOnqz3O9pvW430Z2-uYBLDHMluHUddnh3Y4EfrUHZd7sthrCbSIATiLYrzRGn-u7Jw0&vault=true&intent=subscription" data-sdk-integration-source="button-factory"></script>
<script>
  paypal.Buttons({
      style: {
          shape: 'pill',
          color: 'gold',
          layout: 'vertical',
          label: 'subscribe'
      },
      createSubscription: function(data, actions) {
        return actions.subscription.create({
          'plan_id': 'P-3HB65307W93769043L63FTMQ'
        });
      },
      onApprove: function(data, actions) {
        alert(data.subscriptionID);
      }
  }).render('#paypal-button-container');
</script>
