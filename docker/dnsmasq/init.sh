#!/bin/sh

while sleep 1; do
    ls /etc/dnsmasq.d/. | entr -r dnsmasq
done