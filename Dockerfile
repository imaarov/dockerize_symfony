FROM php:8.1-fpm-alpine

# Apk install
RUN apk update && apk add bash git

# Init composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer

# Symfony CLI
RUN wget https://get.symfony.com/cli/installer -O - | bash 
RUN cp /root/.symfony5/bin/symfony /usr/local/bin/symfony

WORKDIR /var/www/html
