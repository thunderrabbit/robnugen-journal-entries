#!/bin/bash


echo "This script ensures we pull any commits that have been committed"
echo "on the server that my quill.plasticaddy.com site points to via Micropub."
echo
echo "At this point, it is a test server available at https://hugotest.plasticaddy.com/"
echo "And I soon want to move it to https://robnugen.com/"
echo
echo "Once the site is moved, the command below will have to point to"
echo "the Dreamhost server that runs robnugen.com..  I wonder if I should"
echo "create a new server for that."
echo
echo "When you update this file, also update file ~/journal/push_then_pull_on_micropub_server.sh"
echo

echo "pushing remote commits"
ssh hpc 'cd /home/hugotest_dh_dfenwd/barefoot_rob/content/journal/; git push'

echo "pulling those commits here on local repo"
git pull
