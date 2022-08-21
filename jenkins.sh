#!/bin/bash
sudo yum install -y jenkins java-11-openjdk-devel
sudo yum -y install wget
sudo wget -O /etc/yum.repos.d/jenkins.repo && http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum upgrade
sudo yum install jenkins

