#!/bin/bash
cd ~/barefoot_rob

open http://localhost:1313/

echo "building"
hugo server --watch=false
