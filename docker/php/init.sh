#!/bin/sh
if [ ! -e ../static/.inited ]
then 
    cp -R public ../static/.
    mv storage ../static/.
    rm -rf storage
    ln -sf ../static/storage storage
    touch ../static/.inited
fi

php-fpm