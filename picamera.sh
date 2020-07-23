#!/bin/bash

echo ""
echo "================================"
echo "Installing PiCamera for Python 3 ..."
sudo apt-get -y install python-picamera python3-picamera
echo ""
echo "The installation of PiCamera was successful"
echo ""
echo "ATTENTION: Please activate the camera interface in the Raspberry Pi settings!!!"
echo "TESTING: Enter the following in the command line: raspistill -o sample.jpg"
sleep 5
