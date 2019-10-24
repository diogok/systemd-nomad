#!/bin/bash

set -e # stop at error

# stop if cni plugins are installed
[[ -e /opt/cni/bin/vlan ]] && exit 0

version=0.8.2
arch=$(arch)
[[ "$arch" == "armv6l" ]] && arch="arm"
[[ "$arch" == "x86_64" ]] && arch="amd64"

curl -L -o cni-plugins.tgz https://github.com/containernetworking/plugins/releases/download/v$(version)/cni-plugins-linux-$(arch)-v$(version).tgz
sudo mkdir -p /opt/cni/bin
sudo tar -C /opt/cni/bin -xzf cni-plugins.tgz