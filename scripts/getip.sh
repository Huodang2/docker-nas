#!/bin/bash

wanip="$(dig +short myip.opendns.com @resolver4.opendns.com)"
hostname="$(hostname)"

# Check if domain points here
checkdomain() {
    dnsip="$(dig +short $1.$ROOT_DOMAIN @resolver4.opendns.com)"
    if [[ ! $wanip == $dnsip ]]; then
        echo "$1 is not pointing to your ip"
        exit 1
    fi
} 
