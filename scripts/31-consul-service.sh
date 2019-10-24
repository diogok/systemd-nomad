#!/bin/bash

set -e # stop on error

consul members && exit 0  # stop if active

. /etc/ops/env # load config

sudo mv /etc/ops/consul.service /etc/systemd/system/consul.service

# Enable new UI
echo CONSUL_UI_BETA=true >> /etc/ops/env
# Enable conenct
echo '{"connect":{"enabled":true},"ports":{"grpc":8502}}' > /etc/ops/consul.json

# Set nameserver for recursive DNS
NAMESERVER=`cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }' | head -n1`
echo NAMESERVER=$NAMESERVER >> /etc/ops/env

if [ "$ROLE" == "manager" ]; then
  if [ "$INDEX" == "0" ]; then
    echo CONSUL_ROLE_FLAGS=\"-server -bootstrap-expect=$MANAGER_COUNT\" >> /etc/ops/env
  fi
  if [ "$INDEX" != "0" ]; then
    echo CONSUL_ROLE_FLAGS=\"-server\" >> /etc/ops/env
  fi
fi

if [ "$ROLE" != "manager" ]; then
  echo CONSUL_ROLE_FLAGS= >> /etc/ops/env
fi

cat /etc/systemd/system/consul.service

sudo systemctl daemon-reload
sudo systemctl enable consul

if [ "$START" == "yes" ]; then
  sudo systemctl start consul
fi

