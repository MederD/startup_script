#!/bin/bash
#--below block is to install java
sudo su -
yum update -y
yum upgrade -y
amazon-linux-extras install epel -y
yum install java-1.8* -y
JAVA_HOME=$(find /usr/lib/jvm/java-1*-*64 | head -n 1)
export JAVA_HOME
PATH=$PATH:$JAVA_HOME
sed -i '/PATH=/ s/$/:$JAVA_HOME/' ~/.bash_profile
#--below block is to install jenkins
yum -y install wget
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum -y install jenkins
service jenkins start
chkconfig jenkins on
cat /var/lib/jenkins/secrets/initialAdminPassword > ~/jenkins_initial_admin_passwd.txt
