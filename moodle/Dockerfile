FROM php:7.4-apache
RUN apt-get update && \
    apt-get install -y libjpeg-dev libzip-dev libpng-dev libicu-dev libxml2-dev unzip && \
    docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
    docker-php-ext-install pdo_mysql zip gd intl soap opcache && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    rm -rf /var/lib/apt/lists/*
COPY moodle-config.php /var/www/html/config.php
COPY moodle-docker-entrypoint.sh /usr/local/bin/moodle-docker-entrypoint.sh
RUN chmod +x /usr/local/bin/moodle-docker-entrypoint.sh
ENTRYPOINT ["moodle-docker-entrypoint.sh"]
