#!/bin/bash

DBHOST=localhost
DBNAME=CONFLUENCE
DBUSER=root
DBPASSWD=123456
file=/vagrant/atlassian-confluence-7.3.1-x64.bin
vfile=/vagrant/response.varfile

sudo apt install -y openjdk-11-jdk
sudo apt install -y mysql-server

sed -i '/bind-address/ a \
character-set-server = utf8mb4 \
collation-server = utf8mb4_bin \
transaction-isolation = READ-COMMITTED \
' /etc/mysql/mysql.conf.d/mysqld.cnf

 sudo /etc/init.d/mysql restart

mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"
mysql -uroot -p$DBPASSWD -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$DBPASSWD'"

test -e "$file" && {
	$file -q -varfile $vfile
} || {
	echo "NOT FOUND installation file!"
}

cp /vagrant/mysql-connector-java-5.1.48.jar /opt/atlassian/confluence7_3_1/confluence/WEB-INF/lib/
sudo /etc/init.d/mysql restart
sudo /etc/init.d/confluence restart
