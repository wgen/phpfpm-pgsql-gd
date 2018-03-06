FROM php:fpm-alpine3.7

# Install extensions
RUN set -ex && \
	apk --no-cache add \
		freetype-dev \
		libjpeg-turbo-dev \
		libpng-dev \
		libwebp-dev \
		postgresql-dev

# Configure extensions
RUN docker-php-ext-configure gd \
	--with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ --with-webp-dir=/usr/include/ && \
	docker-php-ext-install pdo_pgsql gd