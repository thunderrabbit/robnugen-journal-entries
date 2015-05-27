---
title: perl image thumbnailer
tags: images
author: Rob Nugen
date: 2015-05-27T15:49:39+09:00
---

## 15:49 Wednesday 27 May 2015 JST

    sub makeThumbs {
        my ($sourceImagePath, $thumbImagePath) = @_;
        print "making thumbnail $thumbImagePath from\n$sourceImagePath\n";
    
    	$image = Image::Magick->new;
    	open(IMAGE, $sourceImagePath);
    	$image->Read(file=>\*IMAGE);
    	close(IMAGE);
    
    	$image->Thumbnail('200,200');  ## not sure if this will work
    
    
    	open(IMAGE, ">$thumbImagePath");
    	$image->Write(file=>\*IMAGE, filename=>$thumbImagePath);
    	close(IMAGE);
    }

Hmm!  As I was sketching some code, I found an example [perl script
which produces a page of thumbnailed images](http://imagemagick.org/scripts/examples.php).  Sweet!  I will probably
use it for something.

Hmmm but I wonder why the page has .php extension.
