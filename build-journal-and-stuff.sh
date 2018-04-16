#!/bin/bash
echo "pushing"
git push

echo "pulling"
cd ~/journal-hugo
git submodule foreach git pull

echo "building"
hugo

echo "deploying"
echo "changing directory"
cd public
git reset 72aff30
echo "sleeping"
sleep 5
echo "adding"
git add .
echo "sleeping"
sleep 5
echo "committing"
git commit -m "Published on `date`"
echo "sleeping"
sleep 5
echo "pushing"
git push --force origin master

