#!/bin/bash
# This is designed to show what files exist on my journal Micropub server endpoint but not included in the journal repo
#
# 3 January 2021
#
# -F specifies a config file that does not show the ssh key visual fingerprint
# hpc is my journal Micropub server endpoint defined in .ssh/config_no_visual_keys
# git ls-files -o  shows untracked files on a line per line basis but does not handle spaces in filesnames  https://stackoverflow.com/a/8506155/194309

ssh -F ~/.ssh/config_no_visual_keys hpc 'cd ~/barefoot_rob/content/journal/ ; git ls-files -o'
