#!/usr/bin/env bash
# shellcheck source=../lib/env.sh
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "[PHP] Installing ..."
tryInstall install php8.1-cli || true

# Composer
cd "$HOME" || exit 1
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
sudo mv composer.phar /usr/local/bin/composer
rm -f composer-setup.php
cd "$INSTALL_DIR" || true

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

command -v composer &>/dev/null && composer require laravel/pint --dev 2>/dev/null || true
