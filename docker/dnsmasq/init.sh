#!/bin/sh

while sleep 1; do
    ls /var/dnsmasq-webui/etc/. | entr -r dnsmasq
done