#!/bin/bash

# stop on error
set -e

. /etc/ops/env

# if no weave, create a network anyway
[[ "$WEAVE" == "no" ]] && sudo docker network create --subnet 10.2.2.0/24 --gateway 10.2.2.1 network || true
[[ "$WEAVE" == "no" ]] && exit 0

# stop if weave is installed
command -v weave && exit 0

# install weave
sudo curl -L git.io/weave -o /usr/local/bin/weave
sudo chmod a+x /usr/local/bin/weave

