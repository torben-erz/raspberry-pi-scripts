#!/bin/bash

# System update
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade --fix-missing -y
sudo apt autoremove

# Update Firmware
sudo rpi-update
