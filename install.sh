#!/bin/bash

# Install dependencies
sudo apt-get install libimlib2-dev libglm-dev mesa-common-dev libxrender-dev libglew-dev libxrandr-dev cmake byzanz zenity wget unzip alsa-utils

# Install slop
wget https://github.com/naelstrof/slop/archive/master.zip --output-document slop.zip
unzip slop.zip
cd slop-master
cmake -DCMAKE_OPENGL_SUPPORT=true ./
make && sudo make install

echo 'slop installed'

# Move files
cd .. # go back to installation folder from /slop
sudo rm -rfv /opt/screencastToGif
sudo mkdir /opt/screencastToGif
sudo cp screencastToGif.png screencastToGif.sh /opt/screencastToGif
sudo chmod 444 /opt/screencastToGif/screencastToGif.png

# Bind Desktop file
sudo cp screencastToGif.desktop /usr/share/applications

echo ''
echo '========================================================================'
echo ''
echo 'All done. You can use the app by writing "screencast" to Unity launcher.'
echo 'Enjoy!'
echo ''