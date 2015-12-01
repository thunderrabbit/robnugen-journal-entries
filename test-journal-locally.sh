#!/bin/bash
cd ~/journal-hugo-local

open http://localhost:1313/

echo "building"
hugo server --watch

echo "coming back"
cd ~/journal
echo "back jack"
