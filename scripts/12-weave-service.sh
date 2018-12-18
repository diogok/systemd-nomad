#!/bin/bash

set -e # stop on error

. /etc/ops/env

[[ "$WEAVE" == "no" ]] && exit 0

sudo mv /etc/ops/weave.service /etc/systemd/system/weave.service 

[[ "$WEAVE_ENC" == "yes" ]] &&  sudo mv /etc/ops/weave-enc.service /etc/systemd/system/weave.service 

weave status && exit 0  # stop if active

cat /etc/systemd/system/weave.service
sudo systemctl daemon-reload

[[ "$ROLE" != "manager" ]] && sleep 10

sudo systemctl daemon-reload
sudo systemctl enable weave
sudo systemctl start weave

