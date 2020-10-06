#!/bin/bash

source config.sh

set -e

#Create the data provision container
docker run --network $DOCKER_NETWORK -e SQLFQDN="sql" -e SQLUSER=SA -e SQLPASS=$SA_PASSWORD -e SQLDB=$SQL_DATABASE openhack/data-load:v1

#Create the POI container
docker run --network $DOCKER_NETWORK -d -p 8080:80 --name poi \
-e ASPNETCORE_ENVIRONMENT=Local \
-e SQL_SERVER=sql -e SQL_PASSWORD=$SA_PASSWORD -e SQL_USER=$SQL_USER \
$IMAGE_PREFIX/poi:v1

sleep 3
curl -i -X GET 'http://localhost:8080/api/poi'