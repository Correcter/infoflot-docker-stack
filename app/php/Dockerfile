FROM php:7-fpm-alpine

RUN docker-php-ext-install calendar
RUN docker-php-ext-install ctype curl
RUN docker-php-ext-install dba
RUN docker-php-ext-install dom
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install ftp
RUN docker-php-ext-install gd
RUN docker-php-ext-install gettext
RUN docker-php-ext-install hash
RUN docker-php-ext-install iconv
RUN docker-php-ext-install intl
RUN docker-php-ext-install json
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo pdo_dblib
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install phar
RUN docker-php-ext-install posix
RUN docker-php-ext-install readline
RUN docker-php-ext-install session
RUN docker-php-ext-install simplexml
RUN docker-php-ext-install soap
RUN docker-php-ext-install sockets
RUN docker-php-ext-install spl
RUN docker-php-ext-install xml
RUN docker-php-ext-install xmlreader
RUN docker-php-ext-install xmlrpc
RUN docker-php-ext-install xmlwriter
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zend_test
RUN docker-php-ext-install zip


RUN mv ./php/php-fpm.ini /etc/php/7.0/fpm/php.ini
RUN mv ./php/php-cli.ini /etc/php/7.0/cli/php.ini
CMD ["php-fpm"]
