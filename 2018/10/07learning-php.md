---
title: "learning PHP"
tags: [ "work", "php" ]
author: Rob Nugen
date: 2018-10-07T07:10:40+09:00
---

##### 07:10 Sunday 07 October 2018 JST

I have started going through
[Modernizing Legacy Applications in PHP](https://leanpub.com/mlaphp)
for AB website, and now the database is loaded via an autoloader.

    <?php
    
    /**
     * This file is part of "Modernizing Legacy Applications in PHP".
     *
     * @copyright 2014-2016 Paul M. Jones <pmjones88@gmail.com>
     * @license https://opensource.org/licenses/bsd-license.php BSD
     */
    
    /**
     * Autoloads classes.
     *
     */
    
    namespace Mlaphp;
    
    class Autoloader
    {
        public function load($class)
        {
            // strip off any leading namespace separator from PHP 5.3
            $class = ltrim($class, '\\');
    
            // the eventual file path
            $subpath = '';
    
            // is there a PHP 5.3 namespace separator?
            $pos = strrpos($class, '\\');
            if ($pos !== false) {
                // convert namespace separators to directory separators
                $ns = substr($class, 0, $pos);
                $subpath = str_replace('\\', DIRECTORY_SEPARATOR, $ns)
                         . DIRECTORY_SEPARATOR;
                // remove the namespace portion from the final class name portion
                $class = substr($class, $pos + 1);
            }
    
            // convert underscores in the class name to directory separators
            $subpath .= str_replace('_', DIRECTORY_SEPARATOR, $class);
    
            // the path to our central class directory location
            $dir = dirname(__DIR__);
    
            // prefix with the central directory location and suffix with .php,
            // then require it.
            $file = $dir . DIRECTORY_SEPARATOR . $subpath . '.php';
            require $file;
        }
    }

I had to tweak the file path for the database file from

    classes/database/class.database.php

to

    classes/Database/Database.php

And add `namespace Database` to it, but now it is loaded via the
autoloader script above in alllll the places it is needed.  Overall, I
removed 75 lines of `require_once('class.database.php')`
