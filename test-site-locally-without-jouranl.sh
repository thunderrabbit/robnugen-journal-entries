#!/bin/bash
cd ~/barefoot_rob

rm -rf content/journal/19*
rm -rf content/journal/200*
rm -rf content/journal/201*

rm -rf content/public/*

open http://localhost:1313/

echo "building"
hugo server
