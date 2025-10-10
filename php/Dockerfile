# PHP 7.4 FPM
FROM php:7.4-fpm

WORKDIR /var/www

# 系統相依套件
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libzip-dev \
    libonig-dev \
    unzip \
    git \
 && docker-php-ext-install \
    intl mbstring zip pdo pdo_mysql \
 # 安裝對應 7.4 穩定版的 redis 擴充（避免抓到與 7.4 不相容的新版本）
 && pecl install redis-5.3.7 \
 && docker-php-ext-enable redis \
 && rm -rf /var/lib/apt/lists/*

# 安裝 Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php \
 && php -r "unlink('composer-setup.php');" \
 && mv composer.phar /usr/local/bin/composer

CMD ["php-fpm"]
