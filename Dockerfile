FROM php:7.4-apache
 
ARG DEBIAN_FRONTEND=noninteractive

# Update
RUN apt update  && \
    apt upgrade -y

# Install useful tools
RUN apt install -y wget \
    curl git nano zip

# Libs
RUN apt install -y libcurl4 libcurl4-openssl-dev libzip4 zip libzip-dev icu-devtools libicu67 libicu-dev libonig-dev libpq-dev curl ca-certificates gnupg wget

# Configure postgresql extension
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
    

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

# Install xdebug
RUN pecl install xdebug-3.0.0 && \
    docker-php-ext-enable xdebug

# PHP Extensions
RUN docker-php-ext-install pdo_mysql && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install curl && \
    docker-php-ext-install zip && \
    docker-php-ext-install -j$(nproc) intl && \
    docker-php-ext-install mbstring && \
    docker-php-ext-install gettext && \
    docker-php-ext-install calendar && \
    docker-php-ext-install exif  

# Cleanup
RUN rm -rf /usr/src/*  

# Enable apache modules
RUN a2enmod rewrite headers
RUN a2enmod rewrite