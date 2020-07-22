#!/bin/bash

# Version
version="4.1.0.25"

# System update
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade --fix-missing -y
sudo apt autoremove

# Install tools and libraries for OpenCV
sudo apt-get -y install libhdf5-dev libhdf5-serial-dev libatlas-base-dev libjasper-dev libqtgui4 libqt4-test

# Install Paython3, pip3 and numpy
wget https://raw.githubusercontent.com/torben-erz/raspberry-pi-scripts/master/installs/python3.sh
sh python3.sh
rm python3.sh

# Install OpenCV
pip3 install opencv-python==$version
