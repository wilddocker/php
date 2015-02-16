FROM php:5.6-fpm

MAINTAINER Ivan Kuznetsov "kuzma.wm@gmail.com"

WORKDIR /var/www/html/web

COPY load.ini /tmp/load.ini

RUN echo 'php_admin_flag[log_errors] = on' >> /usr/local/etc/php-fpm.conf \
 && echo 'catch_workers_output = yes' >> /usr/local/etc/php-fpm.conf \
 && apt-get update \
 && apt-get install -y zlib1g-dev libpng-dev \
 && rm -rf /var/lib/apt/lists/* \
 && pecl install mongo \
 && echo 'extension=mongo.so' >> /usr/local/etc/php/conf.d/mongo.ini \
 && pecl install redis \
 && echo 'extension=redis.so' >> /usr/local/etc/php/conf.d/redis.ini \
 && pecl install memcache \
 && echo 'extension=memcache.so' >> /usr/local/etc/php/conf.d/memcache.ini \
 && docker-php-ext-install zip mysql pdo_mysql mbstring opcache gd \
 && cat /tmp/load.ini >> /usr/local/etc/php-fpm.conf

COPY entry-point.sh /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]
CMD ["php-fpm"]
