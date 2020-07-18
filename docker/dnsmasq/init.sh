#!/bin/sh

touch /var/www/html/storage/app/dnsmasq/addn-hosts.conf
touch /var/www/html/storage/app/dnsmasq/hosts
touch /var/www/html/storage/app/dnsmasq/records.conf
touch /var/www/html/storage/app/dnsmasq/resolv
touch /var/www/html/storage/app/dnsmasq/resolv.conf


while sleep 1; do
    ls /var/www/html/storage/app/dnsmasq/. | entr -r dnsmasq
done