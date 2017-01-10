#!/bin/bash
cd "$(dirname "$0")"
for i in $(sudo awk '!/*|!/' /etc/shadow | cut -d ':' -f 1) ; do
	PWD=$(pwgen -1s 15 1)
	echo $i"    "$PWD >> passwords.txt
	chpasswd <<< i "$i:$PWD"
done
openssl des3 -salt -in passwords.txt -out passwords.enc && rm passwords.txt
