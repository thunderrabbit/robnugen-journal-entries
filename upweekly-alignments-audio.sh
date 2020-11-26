#!/bin/bash
# This is designed to make it easier to copy Weekly Alignment .mp3 and .ogg files from finder to b.robnugen.com

THISYEAR=$(date +'%Y')

echo remember you can
echo ssh b.rn "'mkdir -p ~/b.robnugen.com/rob/presentations/weekly-alignments/$THISYEAR'"

scp $@ b.rn:b.robnugen.com/rob/presentations/weekly-alignments/$THISYEAR




