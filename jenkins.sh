#!/bin/bash
sudo yum update -y 
sudo yum -y install wget
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install java-11-openjdk
sudo yum upgrade
sudo yum install jenkins

