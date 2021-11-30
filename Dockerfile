FROM php:8.0-apache
 
ARG DEBIAN_FRONTEND=noninteractive

# Update
RUN apt update  && \
    apt upgrade -y

# Install useful tools
RUN apt install -y wget \
    curl git nano zip

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

# Install xdebug
RUN pecl install xdebug-3.0.0 && \
    docker-php-ext-enable xdebug