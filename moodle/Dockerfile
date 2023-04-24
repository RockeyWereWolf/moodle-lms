FROM php:8.2-apache
RUN apt-get update && \
    apt-get install -y rsync libfreetype6-dev libjpeg-dev libzip-dev libpng-dev libicu-dev libxml2-dev unzip && \
    docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
    docker-php-ext-install mysqli pdo_mysql zip gd intl soap opcache && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    rm -rf /usr/src/moodle && \
    mkdir -p /usr/src/moodle && \
    curl -sSL https://download.moodle.org/download.php/direct/stable402/moodle-4.2.tgz | tar -xzf - -C /usr/src/moodle --strip-components=1 && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    rm -rf /var/lib/apt/lists/*
EXPOSE 8080
COPY moodle-config.php /var/www/html/config.php
COPY moodle-docker-entrypoint.sh /usr/local/bin/moodle-docker-entrypoint.sh
RUN chmod +x /usr/local/bin/moodle-docker-entrypoint.sh
ENTRYPOINT ["moodle-docker-entrypoint.sh"]
