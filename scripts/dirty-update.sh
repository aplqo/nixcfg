#!/bin/sh

set -xu

if [ -z "$1" ]
then
  echo "Source directory required"
  exit
fi

rm -rf /etc/nixos
cp -r "$1" /etc/nixos
