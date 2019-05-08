FROM php:7.2-fpm

LABEL maintainer="morgan <get_object@163.com>"

#
#--------------------------------------------------------------------------
# Software's Installation
#--------------------------------------------------------------------------
#
# Installing tools and PHP extentions using "apt", "docker-php", "pecl",
#

RUN apt-get update -yqq && \
    apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
	apt-utils \
	curl \
	libmemcached-dev \
	libz-dev \
	libpq-dev \
	libjpeg-dev \
	libpng-dev \
	libfreetype6-dev \
	libssl-dev \
	libmcrypt-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& pecl channel-update pecl.php.net

# Install the pdo extension
RUN docker-php-ext-install pdo_mysql \
	# Install the PHP pdo_pgsql extention
	&& docker-php-ext-install pdo_pgsql \
	# Install the PHP gd library
	&& docker-php-ext-configure gd \
	--with-jpeg-dir=/usr/lib \
	--with-freetype-dir=/usr/include/freetype2 && \
	docker-php-ext-install gd

# Install the redis extension
RUN printf "\n" | pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

# Install the mongodb extension
RUN pecl install mongodb && docker-php-ext-enable mongodb

# Install the amqp extension
RUN apt-get update -yqq && \
    apt-get install librabbitmq-dev -y && \
    # Install the amqp extension
    pecl install amqp && \
    docker-php-ext-enable amqp

# Install the ziparchive extension
RUN apt-get install libzip-dev -y && \
    docker-php-ext-configure zip --with-libzip && \
    # Install the zip extension
    docker-php-ext-install zip

# Install the bcmath extension
RUN docker-php-ext-install bcmath

# Install the gmp extension
RUN apt-get install -y libgmp-dev && docker-php-ext-install gmp

# Install the mysqli extension
RUN docker-php-ext-install mysqli

# Install the tokenizer extension
RUN docker-php-ext-install tokenizer

# Install the sockets extension
RUN docker-php-ext-install sockets

# Human Language and Character Encoding Support
RUN apt-get install -y zlib1g-dev libicu-dev g++ && \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl

# Image optimizers
USER root

RUN apt-get install -y jpegoptim optipng pngquant gifsicle

# Install the imageMagick extension
USER root

RUN apt-get install -y libmagickwand-dev imagemagick && \
    pecl install imagick && \
    docker-php-ext-enable imagick

#
#--------------------------------------------------------------------------
# Final Touch
#--------------------------------------------------------------------------
#

USER root

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

RUN usermod -u 1000 www-data

WORKDIR /var/www

