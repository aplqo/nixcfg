#!/bin/sh

set -o errexit -o nounset

readonly path="$(realpath -e "$1")"

. ./vars.sh

mkfs.ext4 -v -L "$lfs_label" "$lfs_disk"
mount -v "$lfs_disk" "$LFS"

pushd "$LFS"
echo "Restoring backups..."
tar -xpf "$path"
popd

umount -v "$LFS"
