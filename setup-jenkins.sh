#!/bin/bash
#Installing the git & maven &wget
sudo yum install -y maven git wget

# Installing the java
sudo yum install java-17-amazon-corretto -y

#Let Download the jenkins Repo
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#Install the jenkins
sudo yum install jenkins -y

#Start the jenkins service
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service


