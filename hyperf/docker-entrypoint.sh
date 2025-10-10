#!/usr/bin/env bash
# BASEDIR=$(cd $(dirname $0); pwd)

cd /var/www/newapi

rm -Rf /var/www/newapi/runtime/container/*
#启动 php-hyperf 服务

APP_DIR="/var/www/newapi"
# 若 vendor 不在（多半是被 bind mount 覆蓋掉），就安裝
if [ ! -f "$APP_DIR/vendor/autoload.php" ]; then
  echo ">>> vendor/ missing, running composer install..."
  cd "$APP_DIR"
  composer install --no-dev -o --no-interaction
fi

cat /var/www/newapi/.env
php -m
php /var/www/newapi/bin/hyperf.php start
