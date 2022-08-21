#!/bin/bash
sudo apt update -y
sudo apt install openjdk-8-jdk
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo apt-get update && sudo apt-get upgrade
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt install -y jenkins 



