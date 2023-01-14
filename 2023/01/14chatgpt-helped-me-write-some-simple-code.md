---
title: "ChatGPT helped me write some simple code"
tags: [ "chatgpt", "php", "code", "stackoverflow" ]
author: Rob Nugen
date: 2023-01-14T10:22:25+09:00
draft: false
---

(written 10:22 Saturday 14 January 2023 JST)

Chat GPT helped me out yesterday.  I didn't want to be bothered to
search how to do this, and embarrassingly I didn't know instantly how
to do it with `abs()` but I knew it was easier than a bunch of crap my
brain was thinking.

Here was my prompt:

    write php code to check if two numbers are within 10000 of each other

In a trice, I got this back:

    <?php
    $num1 = 20000;
    $num2 = 21000;
    
    if(abs($num1 - $num2) <= 10000) {
        echo "The numbers are within 10000 of each other.";
    } else {
        echo "The numbers are not within 10000 of each other.";
    }
    ?>

    This code uses the abs() function to calculate the absolute
    difference between $num1 and $num2. If this difference is less
    than or equal to 10000, the message "The numbers are within 10000
    of each other" will be printed. Otherwise, the message "The
    numbers are not within 10000 of each other" will be printed.

Wow.  Well, that ain't bad, but it could be better:

    use a variable for the constant

    <?php
    $num1 = 20000;
    $num2 = 21000;
    $difference = 10000;
    
    if(abs($num1 - $num2) <= $difference) {
        echo "The numbers are within $difference of each other.";
    } else {
        echo "The numbers are not within $difference of each other.";
    }
    ?>

    In this code, we have a variable $difference that holds the
    constant value of 10000. This value is then used in the comparison
    to check if the difference between $num1 and $num2 is less than or
    equal to $difference. This allows you to easily change the
    threshold for "within x of each other" by changing the value of
    the $difference variable.

Then I tried to really push the limits with a horribly unclear and unpunctuated
query:

    why wouldn't you call difference tolerance?

Misunderstaning my meaning, it gave an otherwise reasonable response:

    "Difference tolerance" would be a more appropriate name for the
    variable that holds the constant value of 10000, as it represents
    the tolerance or range within which the numbers are considered to
    be close to each other. Naming variables in a way that reflects
    their purpose makes the code more readable and easier to
    understand. The term "difference tolerance" gives a clear
    indication of what the variable is used for, whereas the term
    "constant" does not.
    
    It could also be named "threshold" or "range", as it represents
    the range within which the two numbers are considered close to
    each other.

I decided to go easy, using some punctuation:

    well, fix the name of the constant

    <?php
    $num1 = 20000;
    $num2 = 21000;
    $tolerance = 10000;
    
    if(abs($num1 - $num2) <= $tolerance) {
        echo "The numbers are within $tolerance of each other.";
    } else {
        echo "The numbers are not within $tolerance of each other.";
    }
    ?>
    
    In this code, the variable $tolerance holds the constant value of
    10000, which represents the range within which the two numbers are
    considered to be close to each other. The variable is
    appropriately named "tolerance" as it reflects the purpose of the
    variable. This makes the code more readable and easy to
    understand.

Wow.  Interesting enough to post it here.

Screenshots:


[![2023 jan 13 chatgpt php 1 hardcode](//b.robnugen.com/journal/2023/thumbs/2023_jan_13_chatgpt_php_1_hardcode.png)](//b.robnugen.com/journal/2023/2023_jan_13_chatgpt_php_1_hardcode.png)

[![2023 jan 13 chatgpt php 2 variable](//b.robnugen.com/journal/2023/thumbs/2023_jan_13_chatgpt_php_2_variable.png)](//b.robnugen.com/journal/2023/2023_jan_13_chatgpt_php_2_variable.png)

[![2023 jan 13 chatgpt php 3 nonsense](//b.robnugen.com/journal/2023/thumbs/2023_jan_13_chatgpt_php_3_nonsense.png)](//b.robnugen.com/journal/2023/2023_jan_13_chatgpt_php_3_nonsense.png)

[![2023 jan 13 chatgpt php 4 tolerance](//b.robnugen.com/journal/2023/thumbs/2023_jan_13_chatgpt_php_4_tolerance.png)](//b.robnugen.com/journal/2023/2023_jan_13_chatgpt_php_4_tolerance.png)