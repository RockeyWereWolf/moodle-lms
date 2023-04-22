#!/bin/bash

set -e

if [ "$1" = 'apache2-foreground' ]; then
    # Install Moodle if not already installed
    if [ ! -e /var/www/html/index.php ]; then
        echo "Moodle not found in $(pwd) - copying now..."
        rsync -av /usr/src/moodle/ /var/www/html/
        chown -R www-data:www-data /var/www/html
        chmod -R 0755 /var/www/html
        mkdir -p /var/www/html/moodledata
        chown -R www-data:www-data /var/www/html/moodledata
    fi

    exec apache2-foreground
fi

exec "$@"
