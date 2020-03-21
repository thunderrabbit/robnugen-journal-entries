#!/bin/bash
# This is designed to copy a directory of images from Finder to b.robnugen.com

echo remember you can
echo ssh b.rn 'mkdir -p ~/b.robnugen.com/journal/2020'

DIRECTORY=$1

if [ ! -d "$DIRECTORY" ]; then
    echo "usage $0 <directory>"
    echo "This should be a directory: $DIRECTORY"
    exit
fi

rm $DIRECTORY/.DS_Store
scp -r $DIRECTORY b.rn:b.robnugen.com/journal/2020
ssh b.rn 'find ~/b.robnugen.com/journal/2020 -type f -exec chmod 644 -- {} +'
ssh b.rn 'find ~/b.robnugen.com/journal/2020 -type d -exec chmod 755 -- {} +'
