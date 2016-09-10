#!/bin/bash
cd "$(dirname "$0")"
space=$(echo "     ")
c=$(echo ":")
#for i in 'cat /var/tmp/users'; do
for i in $(getent passwd | grep /home/ | cut -d ':' -f 1) ; do
PWD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
echo $i$space$PWD >> ./passwords.txt
chpasswd <<<"$i:$PWD"
#echo $PWD$c$PWD | chpasswd  #passwd --stdin $i
done
