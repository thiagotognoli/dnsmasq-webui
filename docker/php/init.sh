#!/bin/sh
if [ ! -e ../static/.inited ]
then 
    cp -R public ../static/.
    mv storage ../static/.
    touch ../static/.inited
fi
rm -rf storage
ln -sf storage ../static/storage
php-fpm