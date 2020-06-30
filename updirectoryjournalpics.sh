#!/bin/bash
# This is designed to copy a directory of images from Finder to b.robnugen.com

THISYEAR=$(date +'%Y')

echo remember you can
echo ssh b.rn "'mkdir -p ~/b.robnugen.com/journal/$THISYEAR'"

DIRECTORY=$1

if [ ! -d "$DIRECTORY" ]; then
    echo "usage $0 <directory>"
    echo "This should be a directory: $DIRECTORY"
    exit
fi

rm $DIRECTORY/.DS_Store
scp -r $DIRECTORY b.rn:b.robnugen.com/journal/$THISYEAR
ssh b.rn "'find ~/b.robnugen.com/journal/$THISYEAR -type f -exec chmod 644 -- {} +'"
ssh b.rn "'find ~/b.robnugen.com/journal/$THISYEAR -type d -exec chmod 755 -- {} +'"
