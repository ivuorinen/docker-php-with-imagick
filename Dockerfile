FROM php:7.4

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN echo "" \
  && docker-php-ext-install bcmath \
  && docker-php-ext-configure pcntl \
  && docker-php-ext-install pcntl \
  && apt-get update \
  && apt-get install -y \
  libicu-dev libxml2-dev libfreetype6-dev libjpeg62-turbo-dev \
  libpng-dev libonig-dev libmagickwand-dev python-dev unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) intl mbstring pdo xml gd exif bcmath \
  && pecl install imagick && docker-php-ext-enable imagick \
  && curl -sS https://getcomposer.org/installer \
  | php -- --install-dir=/usr/local/bin --filename=composer
RUN php --version \
  && composer --version

