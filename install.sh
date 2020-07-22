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


# Step 2: Download scripts
echo ""
echo "================================"
echo "Downloading scripts ..."
wget https://raw.githubusercontent.com/torben-erz/raspberry-pi-scripts/master/python3.sh
wget https://raw.githubusercontent.com/torben-erz/raspberry-pi-scripts/master/gpio.sh

echo ""
echo "Complete"


# Step 3: Execute installation script python3
echo ""
echo "================================"
echo "Execute Installation of Python3 ..."
sh ./python3.sh

echo ""
echo "Complete"


# Step 4: Execute installation script GPIO
echo ""
echo "================================"
echo "Execute Installation of GPIO ..."
sh ./gpio.sh

echo ""
echo "Complete"


# Step 5: Delete sh-scripts
echo ""
echo "================================"
echo "Delete sh-scripts ..."
rm -rf python3.sh
rm -rf gpio.sh

echo ""
echo "Complete"


# Step 6: Install Python3 IDLE
echo ""
echo "================================"
echo "Install Python3 IDLE"
sudo apt-get -y install idle3

echo ""
echo "Complete"
