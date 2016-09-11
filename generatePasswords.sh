#!/bin/bash
cd "$(dirname "$0")"
for i in $(getent passwd | grep /home/ | cut -d ':' -f 1) ; do
PWD=$(cat /dev/urandom | tr -dc 'a-zA-Z1-9' | fold -w 8 | head -n 1)
echo $i"    "$PWD >> ./passwords.txt
chpasswd <<<"$i:$PWD"
done
