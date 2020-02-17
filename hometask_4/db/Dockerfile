# Ubuntu
FROM --platform=linux/amd64 ubuntu:latest
#FROM ubuntu:18.04
MAINTAINER nazarii.tsymbalista@gmail.com

ENV MYSQL_ROOT_PASSWORD somewordpress
ENV MYSQL_DATABASE wordpress
ENV MYSQL_USER wordpress
ENV MYSQL_PASSWORD wordpress
ENV DEBIAN_FRONTEND noninteractive

#Update Ubuntu
RUN apt-get update
# RUN apt-get install -y apt-utils

#Install mysql
RUN apt-get install -y mysql-server

RUN usermod -d /var/lib/mysql/ mysql
RUN service mysql start 

CMD ["mysqld"]