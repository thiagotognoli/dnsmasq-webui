FROM php:7.3-fpm-alpine

#RUN mkdir -p /var/www/html

WORKDIR /var/www/html
COPY init.sh init.sh
RUN set -ex \
#    && echo 'memory_limit = -1' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
#    && apk add --no-cache \
#        dnsmasq \
#	ca-certificates \
#	composer \
#    && update-ca-certificates \
#    && mkdir -p /var/www/html && cd /var/www/html \
    && curl -sL https://github.com/thiagotognoli/dnsmasq-webui/archive/master.tar.gz | tar xzf - --strip-components=1 \
    && composer install \
    && composer run-script post-root-package-install \
    && composer run-script post-create-project-cmd \
    && sed -i '/^APP_ENV/ s/local/production/g' .env \
    && touch database/database.sqlite \
    && php artisan migrate --seed --force \
    && chown www-data:www-data * -R \
    && mv storage _storage
#    && ln -sf /var/www/html/storage/app/dnsmasq/resolv.conf /etc/dnsmasq.d/resolv.conf \
#    && ln -sf /var/www/html/storage/app/dnsmasq/resolv /etc/dnsmasq.d/resolv \
#    && ln -sf /var/www/html/storage/app/dnsmasq/addn-hosts.conf /etc/dnsmasq.d/addn-hosts.conf \
#    && ln -sf /var/www/html/storage/app/dnsmasq/hosts /etc/dnsmasq.d/hosts \
#    && ln -sf /var/www/html/storage/app/dnsmasq/records.conf /etc/dnsmasq.d/records.conf

CMD /var/www/html/init.sh

#ENV NGINX_CONFIG=nginx \
#    SUPERVISOR_CONFIG=supervisor

#EXPOSE 80 53 53/udp
EXPOSE 9000