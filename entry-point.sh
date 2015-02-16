#!/bin/bash

set -e

echo "Replacing MAX_CHILDREN with '$MAX_CHILDREN'"
echo "Replacing MEMORY_LIMIT with '$MEMORY_LIMIT'"
echo "Replacing MAX_EXECUTION_TIME with '$MAX_EXECUTION_TIME'"
echo "Replacing DATE_TIMEZONE with '$DATE_TIMEZONE'"

sed -i "s/MAX_CHILDREN/$MAX_CHILDREN/g" /usr/local/etc/php-fpm.conf
sed -i "s/MEMORY_LIMIT/$MEMORY_LIMIT/g" /usr/local/etc/php-fpm.conf
sed -i "s/MAX_EXECUTION_TIME/$MAX_EXECUTION_TIME/g" /usr/local/etc/php-fpm.conf
sed -i "s/DATE_TIMEZONE/$DATE_TIMEZONE/g" /usr/local/etc/php-fpm.conf

if [ "$1" = 'php-fpm' ]; then
    exec php-fpm
fi

exec "$@"
