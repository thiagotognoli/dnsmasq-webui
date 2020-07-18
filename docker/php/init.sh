#!/bin/sh
if [ ! -e /var/www/static/.inited ]
then 
    cp -R public /var/www/static/.
    cp -R _storage /var/www/static/storage
    touch /var/www/static/.inited
fi
ln -sf /var/www/static/storage /var/www/html/storage
chmod a+rw /var/www/static/storage
php-fpm