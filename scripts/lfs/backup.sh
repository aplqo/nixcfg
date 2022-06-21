#!/bin/sh

set -o errexit -o nounset

. ./vars.sh

readonly dest_name="$(realpath -m "$1").tar.xz"

mount -v "$lfs_disk" "$LFS"

pushd "$LFS"
echo "creating backups..."
tar -cJpf "$dest_name" .
popd

umount -v "$LFS"
