#!/bin/bash
sudo apt update -y
sudo apt install openjdk-8-jdk
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo killall apt apt-get
sudo rm -rf /var/lib/apt/lists/lock
sudo rm -rf /var/cache/apt/archives/lock
sudo rm -rf /var/lib/dpkg/lock*
sudo dpkg --configure -a
sudo apt update 
sudo apt-get update -y
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt install -y jenkins 
