#!/bin/sh

set -e -u

. ./vars.sh

umount -v "$LFS/dev/pts"
umount -v $LFS/{dev,proc,sys,run,tmp}
umount -v "$LFS"
