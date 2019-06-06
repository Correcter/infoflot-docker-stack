FROM php:7-fpm-alpine

RUN docker-php-ext-install iconv
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install phalcon
RUN docker-php-ext-install xsl
RUN docker-php-ext-install soap
RUN docker-php-ext-install gettext
RUN docker-php-ext-install gd2
RUN docker-php-ext-install pcre
RUN docker-php-ext-install json
RUN docker-php-ext-install session
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install openssl
RUN docker-php-ext-install curl
RUN docker-php-ext-install date
RUN docker-php-ext-install ctype
RUN docker-php-ext-install dom
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install hash
RUN docker-php-ext-install libxml
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install mysqlnd
RUN docker-php-ext-install openssl
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install Phar
RUN docker-php-ext-install posix
RUN docker-php-ext-install readline
RUN docker-php-ext-install tokenizer
RUN docker-php-ext-install standard
RUN docker-php-ext-install xml
RUN docker-php-ext-install xmlwriter

RUN mv ./php/php-fpm.ini /etc/php/7.0/fpm/php.ini
RUN mv ./php/php-cli.ini /etc/php/7.0/cli/php.ini
CMD ["php-fpm"]
