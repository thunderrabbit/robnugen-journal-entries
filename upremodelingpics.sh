#!/bin/bash

DIRECTORY="2022_feb_remodeling"

echo "This is designed to copy images to $DIRECTORY (defined above)"

THIS_YEAR=$(date +'%Y')
REMOTE_USER_DIR=/home/thundergoblin
REMOTE_JOURNAL_YEAR=$REMOTE_USER_DIR/b.robnugen.com/journal/$THIS_YEAR

echo creating remote directory $REMOTE_JOURNAL_YEAR/$DIRECTORY

ssh b.rn "mkdir -p $REMOTE_JOURNAL_YEAR/$DIRECTORY"
ssh b.rn "ln $REMOTE_USER_DIR/scripts/index.php $REMOTE_JOURNAL_YEAR/$DIRECTORY/"    # Allow view images via https://b.robnugen.com/

scp $@ b.rn:$REMOTE_JOURNAL_YEAR/$DIRECTORY

ssh b.rn "$REMOTE_USER_DIR/scripts/fix_mode_journal_year.sh"
ssh b.rn "$REMOTE_USER_DIR/scripts/create_thumbs.pl $REMOTE_JOURNAL_YEAR/$DIRECTORY"


