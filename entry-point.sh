#!/bin/bash

set -e

echo "Replacing MAX_CHILDREN with '$MAX_CHILDREN'"
echo "Replacing START_SERVERS with '$START_SERVERS'"
echo "Replacing MIN_SPARE_SERVERS with '$MIN_SPARE_SERVERS'"
echo "Replacing MAX_SPARE_SERVERS with '$MAX_SPARE_SERVERS'"
echo "Replacing MEMORY_LIMIT with '$MEMORY_LIMIT'"
echo "Replacing MAX_EXECUTION_TIME with '$MAX_EXECUTION_TIME'"
echo "Replacing DATE_TIMEZONE with '$DATE_TIMEZONE'"

sed -i "s/MAX_CHILDREN/$MAX_CHILDREN/g" /usr/local/etc/php-fpm.conf
sed -i "s/START_SERVERS/$START_SERVERS/g" /usr/local/etc/php-fpm.conf
sed -i "s/MIN_SPARE_SERVERS/$MIN_SPARE_SERVERS/g" /usr/local/etc/php-fpm.conf
sed -i "s/MAX_SPARE_SERVERS/$MAX_SPARE_SERVERS/g" /usr/local/etc/php-fpm.conf
sed -i "s/MEMORY_LIMIT/$MEMORY_LIMIT/g" /usr/local/etc/php-fpm.conf
sed -i "s/MAX_EXECUTION_TIME/$MAX_EXECUTION_TIME/g" /usr/local/etc/php-fpm.conf
sed -i "s/DATE_TIMEZONE/$DATE_TIMEZONE/g" /usr/local/etc/php-fpm.conf

if [ "$1" = 'php-fpm' ]; then
    exec php-fpm
fi

exec "$@"
