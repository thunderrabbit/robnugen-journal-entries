#!/bin/bash
# This is designed to copy a directory of images from Finder to b.robnugen.com

THIS_YEAR=$(date +'%Y')
REMOTE_USER_DIR=/home/thundergoblin
REMOTE_JOURNAL_YEAR=$REMOTE_USER_DIR/b.robnugen.com/journal/$THIS_YEAR

DIRECTORY=$1

if [ ! -d "$DIRECTORY" ]; then
    echo "usage $0 <directory>"
    echo "This should be a directory: $DIRECTORY"
    exit
fi

BASENAME=$(basename $DIRECTORY)

echo creating remote directory $REMOTE_JOURNAL_YEAR/$BASENAME

ssh b.rn "'mkdir -p $REMOTE_JOURNAL_YEAR/$BASENAME'"

scp -r $DIRECTORY b.rn:$REMOTE_JOURNAL_YEAR/$BASENAME

ssh b.rn "$REMOTE_USER_DIR/scripts/fix_mode_journal_year.sh"

ssh b.rn "$REMOTE_USER_DIR/scripts/create_thumbs.pl $REMOTE_JOURNAL_YEAR/$BASENAME"
