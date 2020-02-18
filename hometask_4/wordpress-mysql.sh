#!/bin/bash

#DBHOST=localhost
#DBNAME=CONFLUENCE
#DBUSER=root
#DBPASSWD=123456
#file=/vagrant/atlassian-confluence-7.3.1-x64.bin
#vfile=/vagrant/response.varfile

sudo apt-get update -y
sudo apt install -y docker.io

# add user in group docker
sudo gpasswd -a vagrant docker


sudo docker network create myNetwork
sudo docker network connect myNetwork mysql
sudo docker network connect myNetwork wordpress
#sudo docker run --name=mysql1 -d mysql/mysql-server:latest
#sudo docker run --name some-wordpress -p 8080:80 -d wordpress
#sudo docker run --name wordpress -p 8080:80 -d nazariitsymbalista/026:wp

# sudo docker run -d -p 3306:3306 a4b2aa6b96c9
# sudo docker build -t ntsymbal/wordpress /vagrant/db
   #sudo docker build -t nazariitsymbalista/026:mysql /vagrant/db
   #sudo docker build -t nazariitsymbalista/026:wp /vagrant/wp
#sudo docker push nazariitsymbalista/026:mysql
# -f /vagrant/db/Dockerfile 
# sudo docker run --name wp-cont --link 4eec18acdfe7 -p 8000:80 -d wordpress

#sudo apt install -y openjdk-11-jdk
#sudo apt install -y mysql-server

#sed -i '/bind-address/ a \
#character-set-server = utf8mb4 \
#collation-server = utf8mb4_bin \
#transaction-isolation = READ-COMMITTED \
# ' /etc/mysql/mysql.conf.d/mysqld.cnf

#sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
# sudo /etc/init.d/mysql restart

#mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
#mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'%' identified by '$DBPASSWD'"
#mysql -uroot -p$DBPASSWD -e "ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '$DBPASSWD'"

#test -e "$file" && {
#	$file -q -varfile $vfile
# } || {
#	echo "NOT FOUND installation file!"
# }

#cp /vagrant/mysql-connector-java-5.1.48.jar /opt/atlassian/confluence7_3_1/confluence/WEB-INF/lib/
#sudo /etc/init.d/mysql restart
#sudo /etc/init.d/confluence restart
