#!/bin/bash
# Installing the JAVA 17
sudo dnf install java-17-amazon-corretto -y

# Check if wget is installed
if ! command -v wget &> /dev/null
then 
    echo "wget not found — installing wget..."
    yum install -y wget
else
    echo "wget is already installed "
fi

# Check if tar is installed
if ! command -v tar &> /dev/null
then 
    echo "tar not found — installing tar..."
    yum install -y tar
else
    echo "tar is already installed "
fi

# Downloading the tomcat tar files
wget https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.13/bin/apache-tomcat-11.0.13.tar.gz

# Extracting the tar files
tar -xzvf  apache-tomcat-11.0.13.tar.gz

# Rename the apache-tomcat-11.0.13 to Tomcat
mv apache-tomcat-11.0.13  tomcat

# Config the user passwd and role at tomcat-users.xml
sed -i '56 a/<role rolename="manager-gui"/>' /home/ec2-user/tomcat/conf/tomcat-users.xml
sed -i '57 a/<role rolename="manager-script"/>' /home/ec2-user/tomcat/conf/tomcat-users.xml
sed -i '58 a/<user username="tomcat" password="root123" roles="manager-gui,manager-script"/>' /home/ec2-user/tomcat/conf/tomcat-users.xml
sed -i '56d' /home/ec2-user/tomcat/conf/tomcat-users.xml

# Deleting the line at webapps/manager/META-INF

sed -i '21d' /home/ec2-user/tomcat/webapps/manager/META-INF/context.xml
sed -i '22d' /home/ec2-user/tomcat/webapps/manager/META-INF/context.xml

# Starting the tomcat
sh /home/ec2-user/tomcat/bin/startup.sh

