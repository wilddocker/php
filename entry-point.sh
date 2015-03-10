#!/bin/bash

set -e

function replace {
    VAR=${2:-$3}
    echo "Replacing '$1' with '$VAR'"
    sed -i "s/$1/$VAR/g" /usr/local/etc/php/conf.d/main.ini
}

replace MAX_CHILDREN        $MAX_CHILDREN           15
replace START_SERVERS       $START_SERVERS          5
replace MIN_SPARE_SERVERS   $MIN_SPARE_SERVERS      3
replace MAX_SPARE_SERVERS   $MAX_SPARE_SERVERS      5
replace MEMORY_LIMIT        $MEMORY_LIMIT           512M
replace MAX_EXECUTION_TIME  $MAX_EXECUTION_TIME     15
replace DATE_TIMEZONE       $DATE_TIMEZONE          UTC
replace XDEBUG_REMOTE_HOST  $XDEBUG_REMOTE_HOST     `/sbin/ip route|awk '/default/ { print $3 }'`
replace XDEBUG_REMOTE_PORT  $XDEBUG_REMOTE_PORT     9015


if [ "$1" = 'php-fpm' ]; then
    exec php-fpm
fi

exec "$@"
