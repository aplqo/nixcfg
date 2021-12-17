#!/bin/sh

set -x

pushd /etc/nixos
git pull
popd
