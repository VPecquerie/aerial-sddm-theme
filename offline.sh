#!/bin/bash 
# Offline playlists installer.

echo "Downloading videos..."

cd playlists
for filename in *.m3u; do
    echo "Downloading collection $filename..."
    folder=../playlist_videos/${filename%%.*}
    while read -r link; do
        echo "$link..."
        wget "$link" -P $folder -q
    done < $filename
    echo "done!"

    echo "Generating new m3u..."
    cd $folder
    ls -1 *.mov > $filename.m3u
    echo "done!"
done
