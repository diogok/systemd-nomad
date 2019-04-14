#!/bin/bash

set -e  # stop on error

# stop if consul is installed
command -v consul && exit 0 || true

sudo mkdir -p /var/lib/consul

version=1.4.4
arch=$(arch)
[[ "$arch" == "armv6l" ]] && arch="arm"
[[ "$arch" == "x86_64" ]] && arch="amd64"

curl https://releases.hashicorp.com/consul/${version}/consul_${version}_linux_${arch}.zip -o consul_${version}_linux_${arch}.zip
unzip consul_${version}_linux_${arch}.zip
rm consul_${version}_linux_${arch}.zip
chmod +x consul

sudo mv consul /usr/local/bin/consul

consul -v

