FROM php:7.2.2-fpm-alpine3.7

RUN set -ex && \
		apk add --update --no-cache --virtual .ext-deps \
		freetype-dev \
		libjpeg-turbo-dev \
		libpng-dev \
		libwebp-dev \
		postgresql-dev

RUN \
	docker-php-ext-configure gd \
	--with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ --with-webp-dir=/usr/include/ && \
	docker-php-ext-install pdo_pgsql gd