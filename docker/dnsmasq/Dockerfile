FROM alpine:3.7

WORKDIR /var/dnsmasq-webui

COPY init.sh init.sh
RUN set -ex \
    && apk add --no-cache \
        dnsmasq \
        entr \
#    && mkdir -p /var/dnsmasq-webui/etc \
#    && touch /var/dnsmasq-webui/etc/resolv.conf  \
#    && touch /var/dnsmasq-webui/etc/resolv  \
#    && touch /var/dnsmasq-webui/etc/addn-hosts.conf  \
#    && touch /var/dnsmasq-webui/etc/hosts  \
#    && touch /var/dnsmasq-webui/etc/records.conf \
    && ln -sf /var/www/html/storage/app/dnsmasq/resolv.conf /etc/dnsmasq.d/resolv.conf \
    && ln -sf /var/www/html/storage/app/dnsmasq/resolv /etc/dnsmasq.d/resolv \
    && ln -sf /var/www/html/storage/app/dnsmasq/addn-hosts.conf /etc/dnsmasq.d/addn-hosts.conf \
    && ln -sf /var/www/html/storage/app/dnsmasq/hosts /etc/dnsmasq.d/hosts \
    && ln -sf /var/www/html/storage/app/dnsmasq/records.conf /etc/dnsmasq.d/records.conf

CMD /var/dnsmasq-webui/init.sh

EXPOSE 53 53/udp