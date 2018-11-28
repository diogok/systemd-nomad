#!/bin/bash

set -e # stop on error

# stop if limit is set
[[ "$(sudo sysctl fs.file-max)" == "fs.file-max = 65536" ]] && exit 0 

sudo sysctl -w vm.max_map_count=262144
echo vm.max_map_count=262144 | sudo tee -a /etc/sysctl.conf

sudo sysctl -w fs.file-max=65536
echo fs.file-max=65536 | sudo tee -a /etc/sysctl.conf

