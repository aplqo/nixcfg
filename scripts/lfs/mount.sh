#!/bin/sh

set -e -u

. ./vars.sh

mount -v "$lfs_disk" "$LFS"

mount -v --bind /dev "$LFS/dev"

mount -v --bind /dev/pts "$LFS/dev/pts"
mount -vt proc proc "$LFS/proc"
mount -vt sysfs sysfs "$LFS/sys"
mount -vt tmpfs tmpfs "$LFS/run"
mount -vt tmpfs tmpfs "$LFS/tmp"

if [ -h" $LFS/dev/shm" ]; then  
  mkdir -pv "$LFS/$(readlink "$LFS/dev/shm")" 
fi
