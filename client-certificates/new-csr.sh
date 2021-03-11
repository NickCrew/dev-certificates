#!/usr/bin/env bash

set -e

if [[ -z "$1" ]]; then
	echo 'Provide path to client/user key'
	exit 1
fi

key_in="$1"
name=`echo $key_in | rev | cut -d '/' -f 1 | rev | cut -d '.' -f 1`
dir=`dirname ${key_in}`
csr_out="${dir}/${name}.csr"

echo "Creating Certificate Signing Request '${name}.csr' from key: ${key_in}"

if ! command -v openssl &>/dev/null
then
	sudo apt-get update && sudo apt-get install -y openssl
fi

openssl req -new \
	-key $key_in \
	-out $csr_out



