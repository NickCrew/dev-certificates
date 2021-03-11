#!/usr/bin/env bash
set -e 

if [[ "$#" != "4" ]]; then
	echo "usage: user.pfx user.key user.crt ca.crt"
	exit 1
fi

pfx_out="$1"
user_key_in="$2"
user_cert_in="$3"
ca_cert_in="$4"


if ! command -v openssl &>/dev/null
then
	sudo apt-get update && sudo apt-get install -y openssl
fi

openssl pkcs12 -export \
	-out $pfx_out \
	-inkey $user_key_in \
	-in $user_cert_in \
	-certfile $ca_cert_in
