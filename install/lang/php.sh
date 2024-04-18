#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/install.sh
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")

info "[PHP] Installing ..."
# PHP 8.1
tryInstall install php8.1-cli 

# Composer
cd ~
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
sudo mv composer.phar /usr/local/bin/composer
rm composer-setup.php
cd $PATH_CURRENT

tryInstall install  \
    php8.1-pgsql    \
    php8.1-fpm      \
    php8.1-curl     \
    php8.1-zip      \
    php8.1-mbstring \
    php8.1-xml      \
    php8.1-gd       \
    php8.1-mysql    \
    imagemagick     \
    php-imagick

composer require laravel/pint --dev
