#!/bin/sh

set -o errexit

readonly bits=32
readonly max_length=200

mkdir -p /var/keys/gitlab
cd /var/keys/gitlab

generate_password() {
  head -c $bits | base64 -w $max_length > $1
}

generate_password root_password
generate_password db
generate_password db_passowrd
generate_password otp
generate_password secret

openssl genrsa -out jws 4096