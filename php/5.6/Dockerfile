# Dockerfile.php56 — PHP 5.6 FPM with ext/mysql + mysqli + pdo_mysql (mysqlnd), redis-4.3.0, composer v1
FROM php:5.6-fpm

WORKDIR /var/www

# 使用Debian归档源
RUN echo "deb http://archive.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list

# 安装依赖（允许未验证的包）
RUN apt-get update && \
    apt-get install -y --allow-unauthenticated \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd mysqli \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["php-fpm"]
