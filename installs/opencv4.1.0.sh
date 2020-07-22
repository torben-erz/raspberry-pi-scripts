#!/bin/bash

# Version
version="4.1.0"

# System update
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade --fix-missing -y
sudo apt autoremove

# Install tools and libraries for OpenCV
sudo apt-get install build-essential cmake pkg-config -y
sudo apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev -y
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
sudo apt-get install libxvidcore-dev libx264-dev -y
sudo apt-get install libgtk2.0-dev libgtk-3-dev -y
sudo apt-get install libatlas-base-dev gfortran -y

# Install Paython3, pip3 and numpy
wget https://raw.githubusercontent.com/torben-erz/raspberry-pi-scripts/master/installs/python3.sh
sh python3.sh
rm python3.sh

# Get OpenCV source code
wget https://github.com/opencv/opencv/archive/$version.zip -O opencv.zip
if [ opencv-$version ]; then
    rm -rf opencv-$version
fi
unzip opencv.zip
rm opencv.zip
wget https://github.com/opencv/opencv_contrib/archive/$version.zip -O opencv_contrib.zip
if [ opencv_contrib-$version ]; then
    rm -rf opencv_contrib-$version
fi
unzip opencv_contrib.zip
rm opencv_contrib.zip

# Compile OpenCV
cd ~/opencv-$version/
if [ build ]; then
    rm -rf build
fi
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
 -D CMAKE_INSTALL_PREFIX=/usr/local \
 -D INSTALL_PYTHON_EXAMPLES=ON \
 -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-$version/modules \
 -D BUILD_EXAMPLES=ON ..

# Build OPENCV
make -j4

# Install OpenCV
sudo make install
sudo ldconfig

echo "Install of OpenCV $version successful - Please reboot the system!"
