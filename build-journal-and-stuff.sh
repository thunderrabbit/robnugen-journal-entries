#!/bin/bash
echo "pushing"
git push bitbucket master
git push norigin master

echo "pulling"
cd ~/journal-hugo
git submodule foreach git pull

echo "building"
hugo

echo "deploying"
echo "changing directory"
cd public
echo "sleeping"
sleep 2
echo "adding"
git add .
echo "sleeping"
sleep 2
echo "committing"
git commit -m "Published on `date`"
echo "sleeping"
sleep 2
echo "pushing"
git push origin master

cd ~/journal
echo skipping ./g2f.sh
echo because it needs the password which I do not have handy
