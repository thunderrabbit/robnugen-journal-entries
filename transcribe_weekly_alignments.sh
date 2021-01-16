#!/bin/bash
# This is designed to make it easier to transcribe Weekly Alignments
# by making them into a video which Youtube can transcribe
#
# My user story:
#
# * I edit an audio file down to what I want to have transcribed
# * Youtube   will transcribe it if I upload it as a video

# done once to set everything up:
# sudo apt install ffmpeg


if [ $# -eq 1 ]
  then
      AUDIO=$1
      IMAGE=/home/thunderrabbit/transcription/Firefox_wallpaper.jpg
      echo You can send an image as second parameter:
      $0 /path/file_mc_file.mp3 /path_to_image_for_vid
fi

if [ $# -eq 2 ]
  then
      AUDIO=$1
      IMAGE=$2
fi

if [ -z $AUDIO ]
  then
      echo Usage $0 /path/to/file.mp3 [/path/to/image.jpg]
      exit
fi

echo using image $IMAGE
echo using audio $AUDIO

filename_no_ext="$AUDIO"
filename_no_ext=${filename_no_ext%.mp3}    # % = remove .mp3 if we sent a .mp3 file
filename_no_ext=${filename_no_ext%.wav}    # % = remove .wav if we sent a .wav file
filename_no_ext=${filename_no_ext%.ogg}    # % = remove .ogg if we sent a .ogg file


ffmpeg -r 1 -loop 1 -y -i $IMAGE -i $AUDIO -acodec mp3 -r 1 -shortest $filename_no_ext.flv



		       
