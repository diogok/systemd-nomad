#!/bin/bash

set -e # stop at error

# stop if docker is installed
command -v docker && exit 0

# install docker the generic way
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh

# allow user to use docker without root
export ME=`whoami` && sudo usermod -a -G docker $ME

sudo systemctl daemon-reload
sudo systemctl enable docker
sudo systemctl start docker

