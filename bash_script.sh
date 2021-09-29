#!/bin/bash
sudo su -
yum update -y
yum upgrade -y
amazon-linux-extras install epel -y
yum install java-1.8* -y
find /usr/lib/jvm/java-1*-*64 | head -n 1 > ~/env.txt
sed -i 's/^/JAVA_HOME/' ~/env.txt
export $(xargs <~/env.txt)
PATH=$PATH:$JAVA_HOME
sed -i '/PATH=/ s/$/:$JAVA_HOME/' ~/.bash_profile
