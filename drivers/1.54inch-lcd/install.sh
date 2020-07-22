#!/bin/bash

echo ""
echo "================================"
echo "Welcome to Installation Script for Raspbian"
echo "Maintained by Torben Daniel Erz (torben.erz@gmail.com)"


# Step 1: Preparing
echo ""
echo "================================"
echo "Preparing system for installation ..."

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade --fix-missing -y
sudo apt autoremove

echo ""
echo "Complete"


# Step 2: Install driver and software for 1.54inch LCD ...
echo ""
echo "================================"
echo "Preparing system for installation ..."
wget https://raw.githubusercontent.com/torben-erz/raspberry-pi-scripts/master/drivers/1.54inch-lcd/LCD-show-190115.tar.gz -O LCD-show-190115.tar.gz
tar xvf LCD-show-190115.tar.gz
rm LCD-show-190115.tar.gz

echo ""
echo "Complete"


# Step 3: Start 1.54inch LCD software ...
#echo ""
#echo "================================"
#echo "Start 1.54inch LCD software ..."
#cd LCD-show
#sudo ./LCD154-show
