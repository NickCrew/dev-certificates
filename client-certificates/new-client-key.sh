#!/usr/bin/env bash

set -e

if [[ -z "$1" ]]; then
	key="$1"
else
	key="${USER}.key"
fi


if ! command -v openssl &>/dev/null
then
	sudo apt-get update && sudo apt-get install -y openssl
fi

openssl genrsa -des3 -out $key 4096
