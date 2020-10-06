#!/bin/bash

source config.sh

set -e

#Remove all existing containers
for container_id in $(docker ps -a | grep -v IMAGE | awk '{print $1}'); do docker rm -f $container_id; done
#Remove network
docker network rm $DOCKER_NETWORK

#Create a network
docker network create $DOCKER_NETWORK

#Create SQL container
docker run --network $DOCKER_NETWORK --name sql \
-e 'ACCEPT_EULA=Y' -e "SA_PASSWORD=$SA_PASSWORD" \
-p 1433:1433 -h sql -e SQLFQDN=sql  \
-d "mcr.microsoft.com/mssql/server:2017-latest"

#Copy DB init file
echo "/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q 'CREATE DATABASE $SQL_DATABASE'" > $SQL_INIT_FILE
chmod +x $SQL_INIT_FILE
docker cp $SQL_INIT_FILE sql:/$SQL_INIT_FILE
rm $SQL_INIT_FILE

docker exec -it sql bash 
