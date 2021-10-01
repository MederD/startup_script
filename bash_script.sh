#!/bin/bash
sudo yum update -y
sudo yum upgrade -y
sudo amazon-linux-extras install epel -y
sudo yum install java-1.8* -y
find /usr/lib/jvm/java-1*-*64 | head -n 1 > ~/env.txt
sed -i 's/^/JAVA_HOME=/' ~/env.txt
export $(xargs <~/env.txt)
PATH=$PATH:$JAVA_HOME
sed -i '/PATH=/ s/$/:$JAVA_HOME/' ~/.bash_profile
#-----------------
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum -y install jenkins
sudo service jenkins start
sudo chkconfig jenkins on
cat /var/lib/jenkins/secrets/initialAdminPassword > ~/jenkins_initial_admin_pswd.txt
#-------------------
sudo yum install git -yum
#------------------------
mkdir /opt/maven
cd /opt/maven
wget http://mirrors.estointernet.in/apache/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz
tar -xvzf apache-maven-3.6.1-bin.tar.gz
sed -i -e '$aM2_HOME=/opt/maven/apache-maven-3.6.1' ~/.bash_profile
sed -i -e 'M2=$M2_HOME/bin' ~/.bash_profile
sed -i '/PATH=/ s/$/:$M2_HOME:$M2/' ~/.bash_profile
