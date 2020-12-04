#!/bin/bash
# This is designed to make it easier to copy Weekly Alignment .mp3 and .ogg files from finder to b.robnugen.com
#
# My user story:
#
# * I created two (n) files, which are on my local file system at /path/file_mc_file.mp3  and /path/file_mc_file.ogg
# * I send these to a year-based directory on my server
# * I see a bit of text based on the file names (and number of files)
#
#
# <audio controls>
# <source src="//b.robnugen.com/rob/presentations/weekly-alignments/2020/file_mc_file.ogg" type="audio/ogg">
# <source src="//b.robnugen.com/rob/presentations/weekly-alignments/2020/file_mc_file.mp3" type="audio/mpeg">
# Your browser does not support this audio content.
# </audio>
#
#
# My reality:
#
# Grab the name, assume it is same for both files, slap on the extensions, and poop it out.
#
# N.B. WE IGNORE any but the first filename argument

echo remember you can
echo ssh b.rn 'mkdir -p ~/b.robnugen.com/rob/presentations/weekly-alignments/$THISYEAR'


if [ $# -ne 1 ]
  then
      echo Usage: $0 /path/file_mc_file.mp3 or .ogg         because we only use one file and assume same name for uploading two files
      exit
fi
   
# constants
remote_path="/home/thundergoblin/b.robnugen.com/rob/presentations/weekly-alignments"
remote_server="b.rn"
real_domain="b.robnugen.com"
url_path="${remote_path#*$real_domain}"    # # = remove everything up to and including b.robnugen.com

echo "url_path = $url_path"

filename="$1"
echo "filename = $filename"
filename_no_ext="$filename"
filename_no_ext=${filename_no_ext%.ogg}    # % = remove .ogg if we sent a .ogg file
filename_no_ext=${filename_no_ext%.mp3}    # % = remove .mp3 if we sent a .mp3 file
echo "filename_no_ext = $filename_no_ext"  # assumes filename is the same name for both .ogg and .mp3

year=$(date +%Y)
echo "year = $year"
filename_no_ext_no_path=$(basename $filename_no_ext)
echo "filename_no_ext = $filename_no_ext"

# You don't need these, but they're cool incantations to have available.
relative_filepath=$(dirname $filename_no_ext_no_path)
absolute_filepath="$( cd "$(dirname "$filename_no_ext_no_path")"; pwd -P )"

ssh "$remote_server" "mkdir -p $remote_path/$year"

scp "$filename_no_ext.ogg" "$remote_server:$remote_path/$year/"
scp "$filename_no_ext.mp3" "$remote_server:$remote_path/$year/"


echo ""
echo ""
echo "<audio controls>"
echo "  <source src=\"//$real_domain$url_path/$year/$filename_no_ext_no_path.ogg\" type=\"audio/ogg\">"
echo "  <source src=\"//$real_domain$url_path/$year/$filename_no_ext_no_path.mp3\" type=\"audio/mpeg\">"
echo "  Your browser does not support this audio content."
echo "</audio>"
echo ""
echo ""





