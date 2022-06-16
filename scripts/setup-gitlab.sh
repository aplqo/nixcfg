#!/bin/sh

set -o errexit

readonly bits=$1
readonly max_length=500

mkdir -p /var/keys/gitlab
cd /var/keys/gitlab

generate_password() {
  head -c $bits /dev/random | base64 -w $max_length > $1
}

generate_password root_password
generate_password db
generate_password db_password
generate_password otp
generate_password secret

openssl genrsa -out jws 4096
chmod og+r jws
