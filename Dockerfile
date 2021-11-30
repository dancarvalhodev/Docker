FROM php:8.0-apache
 
ARG DEBIAN_FRONTEND=noninteractive

# Update
RUN apt update  && \
    apt upgrade -y

# Install xdebug
RUN pecl install xdebug-3.0.0 && \
    docker-php-ext-enable xdebug