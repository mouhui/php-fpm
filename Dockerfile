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