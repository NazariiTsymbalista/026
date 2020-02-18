# Ubuntu
FROM --platform=linux/amd64 ubuntu:latest

MAINTAINER nazarii.tsymbalista@gmail.com

#ENV MYSQL_ROOT_PASSWORD somewordpress
#ENV MYSQL_DATABASE wordpress
#ENV MYSQL_USER wordpress
#ENV MYSQL_PASSWORD wordpress
#ENV DEBIAN_FRONTEND noninteractive
#ENV DBHOST localhost
#ENV DBNAME wordpress
#ENV DBUSER root
#ENV DBPASSWD wordpress

#Update Ubuntu
RUN apt-get update
RUN apt-get install -y apt-utils

#Install mysql
RUN apt-get install -y mysql-server

RUN usermod -d /var/lib/mysql/ mysql
RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/mysql.conf.d/mysqld.cnf

RUN service mysql start start && \
        mysql -uroot -pwordpress -e "CREATE DATABASE wordpress" && \
    	mysql -uroot -pwordpress -e "grant all privileges on wordpress.* to 'root'@'localhost' identified by 'wordpress'" && \
    	mysql -uroot -pwordpress -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'wordpress'"  && \
        mysql -uroot -pwordpress -e "USE mysql; UPDATE user SET Host='%' WHERE User='root' AND Host='localhost'"

CMD ["mysqld"]
