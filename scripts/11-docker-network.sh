#!/bin/bash

# stop on error
set -e

. /etc/ops/env

# create a network
sudo docker network create --subnet 10.2.2.0/24 --gateway 10.2.2.1 network || true
