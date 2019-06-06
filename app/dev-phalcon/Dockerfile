FROM ubuntu:16.04

MAINTAINER Correcter (correcter@inbox.ru)

# Install nginx

RUN apt-get update -y && apt-get install -y wget \
build-essential \
libpcre3-dev \
curl \
gnupg \
git \
libfreetype6-dev \
libjpeg-turbo8-dev \
libxslt-dev \
libicu-dev \
libmcrypt-dev \
libpng12-dev \
libxml2-dev \
python-software-properties \
software-properties-common

RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update -y && apt-get install -y nginx

# Deamon mode off

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx

# Mount the folders

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/var/log/nginx"]

# Expose ports

EXPOSE 80 443

# Add virtual hosts

ADD ./config/conf.d/nginx.conf /etc/nginx/conf.d/nginx.conf
ADD ./config/fastcgi.conf /etc/nginx/fastcgi.conf

RUN mkdir -p /var/www/phalcon

COPY ./www/* /var/www/phalcon

WORKDIR /etc/nginx

CMD ["nginx"]

