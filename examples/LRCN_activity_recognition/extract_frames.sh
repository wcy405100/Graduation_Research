#!/bin/bash

# HOW TO USE!
# ./extract_frames.sh Filename.avi 30

EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -lt $EXPECTED_ARGS ]
then
  echo "Usage: `basename $0` video frames/sec [size=256]"
  exit $E_BADARGS
fi

NAME=${1%.*}
FRAMES=$2
BNAME=`basename $NAME`
echo $BNAME
mkdir -m 755 $BNAME

# the $1 is the avi file we want to convert 
# FRAMES is the frames number we want to extract pre second
# BNAME is from NAME so don't input again

ffmpeg -i $1 -r $FRAMES $BNAME/$BNAME.%4d.jpg
