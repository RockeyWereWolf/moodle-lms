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
# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
# see https://docs.moodle.org/36/en/OPcache
RUN { \
    echo 'opcache.memory_consumption=128'; \
    echo 'opcache.max_accelerated_files=10000'; \
    echo 'opcache.revalidate_freq=60'; \
    echo 'opcache.use_cwd=1'; \
    echo 'opcache.validate_timestamps=1'; \
    echo 'opcache.save_comments=1'; \
    echo 'opcache.enable_file_override=0'; \
  } > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN a2enmod rewrite expires

VOLUME ["/var/www/html", "/var/www/moodledata"]

RUN chown -R www-data:www-data /usr/src/moodle

COPY moodle-docker-entrypoint.sh /usr/local/bin/moodle-docker-entrypoint.sh

RUN chmod +x /usr/local/bin/moodle-docker-entrypoint.sh

ENTRYPOINT ["moodle-docker-entrypoint.sh"]
CMD ["apache2-foreground"]
