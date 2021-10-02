#!/bin/bash
cd /opt
sudo wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.71/bin/apache-tomcat-8.5.71.tar.gz
sudo tar -xvzf /opt/apache-tomcat-8.5.71.tar.gz
sudo chmod +x /opt/apache-tomcat-8.5.71/bin/startup.sh 
sudo chmod +x /opt/apache-tomcat-8.5.71/bin/shutdown.sh
sudo sed -i '/\<Valve / s/^/<\!\-\-  /' /opt/apache-tomcat-8.5.71/webapps/host-manager/META-INF/context.xml
sudo sed -i '/allow=/ s/$/ \-\-\>/' /opt/apache-tomcat-8.5.71/webapps/host-manager/META-INF/context.xml
sudo sed -i '/\<Valve / s/^/<\!\-\-  /' /opt/apache-tomcat-8.5.71/webapps/manager/META-INF/context.xml
sudo sed -i '/allow=/ s/$/ \-\-\>/' /opt/apache-tomcat-8.5.71/webapps/manager/META-INF/context.xml
/opt/apache-tomcat-8.5.71/bin/startup.sh 
/opt/apache-tomcat-8.5.71/bin/startup.sh 
sudo sed -i '/^</tomcat-users>.*/i \<role rolename\=\"manager-gui\"\/\>' /opt/apache-tomcat-8.5.71/conf/tomcat-users.xml
sudo sed -i '/^</tomcat-users>.*/i \<role rolename\=\"manager-script\"\/\>' /opt/apache-tomcat-8.5.71/conf/tomcat-users.xml
sudo sed -i '/^</tomcat-users>.*/i \<role rolename\=\"manager-jmx\"\/\>' /opt/apache-tomcat-8.5.71/conf/tomcat-users.xml
sudo sed -i '/^</tomcat-users>.*/i \<role rolename\=\"manager-status\"\/\>' /opt/apache-tomcat-8.5.71/conf/tomcat-users.xml
sudo sed -i '/^</tomcat-users>.*/i \<user username\=\"admin\" password\=\"admin\" roles\=\"manager-gui, manager-script, manager-jmx, manager-status\"\/\>' /opt/apache-tomcat-8.5.71/conf/tomcat-users.xml
sudo sed -i '/^</tomcat-users>.*/i \<user username\=\"deployer\" password\=\"deployer\" roles\=\"manager-script\"\/\>' /opt/apache-tomcat-8.5.71/conf/tomcat-users.xml
sudo sed -i '/^</tomcat-users>.*/i \<user username\=\"tomcat\" password\=\"s3cret\" roles\=\"manager-gui\"\/\>' /opt/apache-tomcat-8.5.71/conf/tomcat-users.xml