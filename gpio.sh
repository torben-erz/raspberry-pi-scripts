#!/bin/bash

sudo systemctl stop pigpiod

echo ""
echo "================================"
echo "Installing pigpio library ..."
rm pigpio-master
wget https://github.com/joan2937/pigpio/archive/master.zip -O master.zip
unzip -o master.zip
rm master.zip
cd pigpio-master
make
sudo make install


echo ""
echo "================================"
echo "Installing pigpio"
sudo apt-get -y install pigpio python3-pigpio python3-rpi-gpio


sudo systemctl start pigpiod
sudo systemctl enable pigpiod


echo "================================"
echo "The installation of pigpio was successful"
echo ""
echo "ATTENTION: Please reboot the Raspberry Pi!!!"
echo ""
echo "TESTING: "
echo "$ pigs modes 25 w"
echo "$ pigs w 25 1"
echo "$ pigs w 25 0"
sleep 3
