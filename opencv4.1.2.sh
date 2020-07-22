#!/bin/bash

# Version
version="4.1.2"

# System update
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade --fix-missing -y
sudo apt autoremove

# Install tools and libraries for OpenCV
sudo apt-get install build-essential cmake git unzip pkg-config -y
sudo apt-get install libjpeg-dev libpng-dev libtiff-dev -y
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev -y
sudo apt-get install libgtk2.0-dev libcanberra-gtk* -y
sudo apt-get install libxvidcore-dev libx264-dev libgtk-3-dev -y
sudo apt-get install python3-dev python3-numpy -y
sudo apt-get install python-dev python3-pip python-numpy -y
sudo apt-get install libtbb2 libtbb-dev libdc1394-22-dev -y
sudo apt-get install libv4l-dev v4l-utils -y
sudo apt-get install libjasper-dev libopenblas-dev libatlas-base-dev libblas-dev -y
sudo apt-get install liblapack-dev gfortran -y
sudo apt-get install gcc-arm* -y
sudo apt-get install protobuf-compiler -y

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

# Prepare
mv opencv-$version opencv
mv opencv_contrib-$version opencv_contrib
cd ~/opencv/
if [ build ]; then
    rm -rf build
fi
mkdir build
cd build

# System update
sudo apt-get update
sudo apt-get upgrade

# Compile OpenCV
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -D ENABLE_NEON=ON \
    -D ENABLE_VFPV3=ON \
    -D WITH_OPENMP=ON \
    -D BUILD_TIFF=ON \
    -D WITH_FFMPEG=ON \
    -D WITH_GSTREAMER=ON \
    -D WITH_TBB=ON \
    -D BUILD_TBB=ON \
    -D BUILD_TESTS=OFF \
    -D WITH_EIGEN=OFF \
    -D WITH_V4L=ON \
    -D WITH_LIBV4L=ON \
    -D WITH_VTK=OFF \
    -D OPENCV_EXTRA_EXE_LINKER_FLAGS=-latomic \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D BUILD_NEW_PYTHON_SUPPORT=ON \
    -D BUILD_opencv_python3=TRUE \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D BUILD_EXAMPLES=OFF ..

# Build OPENCV
make -j4

# Install OpenCV
sudo make install
sudo ldconfig
sudo apt-get update

echo "Install of OpenCV $version successful - Please reboot the system!"
