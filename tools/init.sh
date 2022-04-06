#!/bin/bash

USER_NAME="mjung"
# DOCKER_MOUNT_PATH="/home/$USER_NAME/data"

# test mac
# DOCKER_MOUNT_PATH="~/data"

# if [ ! -e $DOCKER_MOUNT_PATH ]; then
if [ ! -e ~/data ]; then
    # mkdir -p $DOCKER_MOUNT_PATH/web
    # mkdir -p $DOCKER_MOUNT_PATH/db
    mkdir -p ~/data/web
    mkdir -p ~/data/db
fi


