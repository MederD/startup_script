#!/bin/bash
sudo yum update -y
sudo yum upgrade -y
sudo amazon-linux-extras install epel -y
sudo yum install java-1.8* -y
sudo find /usr/lib/jvm/java-1*-*64 | head -n 1 > ~/env.txt
sudo sed -i 's/^/JAVA_HOME=/' ~/env.txt
sudo export $(xargs <~/env.txt)
PATH=$PATH:$JAVA_HOME
sudo sed -i '/PATH=/ s/$/:$JAVA_HOME/' ~/.bash_profile
sudo cat ~/env.txt >> ~/.bash_profile
source ~./bash_profile
#-----------------
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum -y install jenkins
sudo service jenkins start
sudo chkconfig jenkins on
sudo cat /var/lib/jenkins/secrets/initialAdminPassword > ~/jenkins_initial_admin_pswd.txt
#-------------------
sudo yum install git -y
#------------------------
sudo mkdir /opt/maven
sudo cd /opt/maven
sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.2/binaries/apache-maven-3.8.2-bin.tar.gz
sudo tar -xvzf apache-maven-3.8.2-bin.tar.gz
sudo sed -i -e '$aM2_HOME=/opt/maven/apache-maven-3.8.2' ~/.bash_profile
sudo sed -i -e '$aM2=/opt/maven/apache-maven-3.8.2/bin' ~/.bash_profile
sudo sed -i '/PATH=/ s/$/:$M2_HOME:$M2/' ~/.bash_profile
source ~./bash_profile
