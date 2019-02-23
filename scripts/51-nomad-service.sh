#!/bin/bash

set -e # stop on error

nomad status && exit 0

. /etc/ops/env # load config

if [ "$ROLE" == "manager" ]; then
  if [ "$INDEX" == "0" ]; then
    echo NOMAD_ROLE_FLAGS=\"-server -bootstrap-expect=$MANAGER_COUNT\" >> /etc/ops/env
  fi
  if [ "$INDEX" != "0" ]; then
    echo NOMAD_ROLE_FLAGS=\"-server \" >> /etc/ops/env
  fi
  # Enable prometheus metrics
  echo 'telemetry { publish_allocation_metrics = true publish_node_metrics = true prometheus_metrics = true }' > /etc/ops/nomad.hcl
fi

if [ "$ROLE" != "manager" ]; then
  # Enable privileged docker and raw_exec
  echo 'client { options { docker.privileged.enabled = "true" "driver.raw_exec.enable" = "1"} }' > /etc/ops/nomad.hcl
  echo NOMAD_ROLE_FLAGS=-client >> /etc/ops/env
fi

sudo mv /etc/ops/nomad.service /etc/systemd/system/nomad.service
cat /etc/systemd/system/nomad.service

sudo systemctl daemon-reload
sudo systemctl enable nomad

if [ "$START" == "yes" ]; then
  sudo systemctl start nomad
  sleep 5
  nomad server join $SEED || true
fi

