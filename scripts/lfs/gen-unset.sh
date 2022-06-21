#!/bin/sh

set -o nounset -o errexit

diff "$1" "$2" | sed -e '/^< declare/!d' -e 's/^< declare -x \(.*\)=.*$/\1/' | sed -z -e '1iunset ' -e  's/\n/ /g'
