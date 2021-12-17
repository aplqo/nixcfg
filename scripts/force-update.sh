#!/bin/sh

if [ -z "$1" ]
then
  echo "Source directory required"
  exit
fi

set -xu
rm -rf /etc/nixos
git clone "$1" /etc/nixos
