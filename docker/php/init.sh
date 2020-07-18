#!/bin/sh
if [ ! -e ../static/.inited ]
then 
    cp -R public ../static/.
    mv storage ../static/.
    ln -sf storage ../static/storage
    touch ../static/.inited
fi
php-fpm