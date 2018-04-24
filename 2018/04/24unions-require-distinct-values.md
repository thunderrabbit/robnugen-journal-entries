---
title: "work"
tags: [ "mysql", "work" ]
author: Rob Nugen
date: 2018-04-24T12:30:14+09:00
---

## 12:30 Tuesday 24 April 2018 JST

I need to figure out why some code is not updating some tables.

But first I need a handy way to read the values and change the values.

I just discovered unions require distinct values.

    SELECT 'jan', `arc_updated`, `marked_new`, `current_status_date`, `occupied_date`, `days_on_market`, `date_on_the_market`, `date_available`  FROM `units_2018_01_01` WHERE `unit_id` = 229
    UNION 
    SELECT 'feb', `arc_updated`, `marked_new`, `current_status_date`, `occupied_date`, `days_on_market`, `date_on_the_market`, `date_available`  FROM `units_2018_02_01` WHERE `unit_id` = 229
    UNION
    SELECT 'mar', `arc_updated`, `marked_new`, `current_status_date`, `occupied_date`, `days_on_market`, `date_on_the_market`, `date_available`  FROM `units_2018_03_01` WHERE `unit_id` = 229
    UNION 
    SELECT 'apr', `arc_updated`, `marked_new`, `current_status_date`, `occupied_date`, `days_on_market`, `date_on_the_market`, `date_available`  FROM `units_2018_04_01` WHERE `unit_id` = 229

Because the unit did not change over time, I have to add a fake
different value to the UNION otherwise I get a single row.

And here is my sql to break the values

    UPDATE `units_2018_01_01` SET `days_on_market` = '1' WHERE `unit_id` = 229;
    UPDATE `units_2018_02_01` SET `days_on_market` = '2' WHERE `unit_id` = 229;
    UPDATE `units_2018_03_01` SET `days_on_market` = '3' WHERE `unit_id` = 229;
    UPDATE `units_2018_04_01` SET `days_on_market` = '4' WHERE `unit_id` = 229;

Here they are as single lines so I can copy-paste them easily.

UPDATE `units_2018_01_01` SET `days_on_market` = '1' WHERE `unit_id` = 229;    UPDATE `units_2018_02_01` SET `days_on_market` = '2' WHERE `unit_id` = 229;    UPDATE `units_2018_03_01` SET `days_on_market` = '3' WHERE `unit_id` = 229;    UPDATE `units_2018_04_01` SET `days_on_market` = '4' WHERE `unit_id` = 229;


SELECT 'jan', `arc_updated`, `marked_new`, `current_status_date`, `occupied_date`, `days_on_market`, `date_on_the_market`, `date_available`  FROM `units_2018_01_01` WHERE `unit_id` = 229    UNION     SELECT 'feb', `arc_updated`, `marked_new`, `current_status_date`, `occupied_date`, `days_on_market`, `date_on_the_market`, `date_available`  FROM `units_2018_02_01` WHERE `unit_id` = 229    UNION    SELECT 'mar', `arc_updated`, `marked_new`, `current_status_date`, `occupied_date`, `days_on_market`, `date_on_the_market`, `date_available`  FROM `units_2018_03_01` WHERE `unit_id` = 229    UNION     SELECT 'apr', `arc_updated`, `marked_new`, `current_status_date`, `occupied_date`, `days_on_market`, `date_on_the_market`, `date_available`  FROM `units_2018_04_01` WHERE `unit_id` = 229;
