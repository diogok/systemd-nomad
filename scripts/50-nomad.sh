#!/bin/bash

set -e # stop on error

command -v nomad &&  exit 0 # stop if nomad is installed

sudo mkdir -p /var/lib/nomad

version=0.8.7
arch=$(arch)
[[ "$arch" == "armv6l" ]] && arch="arm"
[[ "$arch" == "x86_64" ]] && arch="amd64"

curl https://releases.hashicorp.com/nomad/${version}/nomad_${version}_linux_${arch}.zip -o nomad_${version}_linux_${arch}.zip
unzip nomad_${version}_linux_${arch}.zip
rm nomad_${version}_linux_${arch}.zip
chmod +x nomad

sudo mv nomad /usr/local/bin/nomad

nomad -v

