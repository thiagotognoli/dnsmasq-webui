#!/bin/sh

touch /var/www/html/storage/app/dnsmasq/addn-hosts.conf
touch /var/www/html/storage/app/dnsmasq/hosts
touch /var/www/html/storage/app/dnsmasq/records.conf
touch /var/www/html/storage/app/dnsmasq/resolv
touch /var/www/html/storage/app/dnsmasq/resolv.conf


dnsmasq -d &
PID=$!

target=/var/www/html/storage/app/dnsmasq

interval=1

while true; do
    changes=$(find ${target} -mmin -${interval})

    if [ ${#changes} -ne 0 ]; then
        date
        kill $PID
        dnsmasq -d &
        PID=$!
    fi

    sleep ${interval}m
done



#while sleep 1; do
#    ls /var/www/html/storage/app/dnsmasq/. | entr -r dnsmasq
#done