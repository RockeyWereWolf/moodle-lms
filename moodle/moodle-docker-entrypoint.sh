#!/bin/bash

rsync -av /usr/src/moodle/ /var/www/html/
chown -R www-data:www-data /var/www/html
chmod -R 0755 /var/www/html
mkdir -p /var/www/html/moodledata
chown -R www-data:www-data /var/www/html/moodledata
chown -R www-data:www-data /var/www
chmod -R 775 /var/www
exec apache2-foreground




