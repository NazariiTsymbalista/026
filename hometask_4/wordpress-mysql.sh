#!/bin/bash

sudo apt-get update -y
sudo apt install -y docker.io

# add user in group docker
sudo gpasswd -a vagrant docker

docker container run -d --name mysql -p 3306:3306 nazariitsymbalista/026:db
docker container run -d --name wordpress -p 8080:80 nazariitsymbalista/026:wp

#network
docker network create myNetwork
docker network connect myNetwork mysql
docker network connect myNetwork wordpress
