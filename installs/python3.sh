#!/bin/bash

# System update
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade --fix-missing -y
sudo apt autoremove

# Install python3, pip3 and numpy
sudo apt-get install python3-dev -y
sudo apt-get install python3-pip -y
sudo pip3 install numpy
