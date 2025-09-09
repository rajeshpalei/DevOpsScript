#!/bin/bash
sudo -i
#Installing the git & maven &wget
yum install -y maven git wget

# Installing the java
yum install java-17-amazon-corretto -y

#Let Download the jenkins Repo
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#Install the jenkins
yum install jenkins -y

#Start the jenkins service
systemctl start jenkins.service
systemctl enable jenkins.service


