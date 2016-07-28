FROM php:7.0.8-fpm

RUN apt-get update && \
    apt-get install -y git wget libssl-dev zlib1g-dev libicu-dev g++ make cmake

# Install PHP extensions
RUN docker-php-ext-install zip mbstring intl opcache bcmath && \
    pecl install xdebug && \
    echo zend_extension=xdebug.so > /usr/local/etc/php/conf.d/xdebug.ini && \
    pecl install apcu-5.1.3 && \
    echo extension=apcu.so > /usr/local/etc/php/conf.d/apcu.ini

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer
