#!/bin/bash

echo -e "Type the folder (with the subfolder inside) name:"
read folder
echo -e "Input the wanted frames/sec:"
read frames
# create a folder to store the subfolder
output="frames"
mkdir -m 755 $output

for subfolder in $folder/*
do
	echo "Inside $(basename $subfolder)"
	mkdir -m 755 $output/$(basename $subfolder)
	for avi in $subfolder/*
	do 
		Temp=$(basename $avi)
		Name=${Temp%.*} 
		mkdir -m 755 $output/$(basename $subfolder)/$Name
		ffmpeg -i $avi -r $frames $output/$(basename $subfolder)/$Name/$Name.%4d.jpg
	done
done
