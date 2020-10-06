#!/bin/bash

repo_name='openhack-containers'
repo_url="https://github.com/Azure-Samples/$repo_name.git"

dir_root="$HOME/$repo_name/"

SA_PASSWORD="yourStrong_Password"
SQL_DATABASE="mydrivingDB"
SQL_INIT_FILE="init_db.sh"
SQL_USER="SA"
 
DOCKER_NETWORK="openhack"
IMAGE_PREFIX="tripinsights" 
