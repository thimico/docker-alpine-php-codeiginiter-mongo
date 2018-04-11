FROM alpine:3.5
MAINTAINER Thiago Menezes <thimico@gmail.com>
ENV PHP_VERSION 5 
RUN apk add --update --no-cache bash \
curl \
curl-dev \
php$PHP_VERSION-intl \
php$PHP_VERSION-openssl \
php$PHP_VERSION-dba \
php$PHP_VERSION-sqlite3 \
php$PHP_VERSION-pear \
php$PHP_VERSION-phpdbg \
php$PHP_VERSION-gmp \
php$PHP_VERSION-pdo_mysql \
php$PHP_VERSION-pcntl \
php$PHP_VERSION-common \
php$PHP_VERSION-xsl \
php$PHP_VERSION-fpm \	
php$PHP_VERSION-mysql \
php$PHP_VERSION-mysqli \
php$PHP_VERSION-enchant \
php$PHP_VERSION-pspell \
php$PHP_VERSION-snmp \
php$PHP_VERSION-doc \
php$PHP_VERSION-dev \
php$PHP_VERSION-xmlrpc \
php$PHP_VERSION-embed \
php$PHP_VERSION-xmlreader \
php$PHP_VERSION-pdo_sqlite \
php$PHP_VERSION-exif \
php$PHP_VERSION-opcache \
php$PHP_VERSION-ldap \
php$PHP_VERSION-posix \	
php$PHP_VERSION-gd  \
php$PHP_VERSION-gettext \
php$PHP_VERSION-json \
php$PHP_VERSION-xml \
php$PHP_VERSION \
php$PHP_VERSION-iconv \
php$PHP_VERSION-sysvshm \
php$PHP_VERSION-curl \
php$PHP_VERSION-shmop \
php$PHP_VERSION-odbc \
php$PHP_VERSION-phar \
php$PHP_VERSION-pdo_pgsql \
php$PHP_VERSION-imap \
php$PHP_VERSION-pdo_dblib \
php$PHP_VERSION-pgsql \
php$PHP_VERSION-pdo_odbc \
php$PHP_VERSION-xdebug \
php$PHP_VERSION-zip \
php$PHP_VERSION-apache2 \
php$PHP_VERSION-cgi \
php$PHP_VERSION-ctype \
php$PHP_VERSION-mcrypt \
php$PHP_VERSION-wddx \
php$PHP_VERSION-bcmath \
php$PHP_VERSION-calendar \
php$PHP_VERSION-dom \
php$PHP_VERSION-sockets \
php$PHP_VERSION-soap \
php$PHP_VERSION-apcu \
php$PHP_VERSION-sysvmsg \
php$PHP_VERSION-zlib \
php$PHP_VERSION-ftp \
php$PHP_VERSION-sysvsem \ 
php$PHP_VERSION-pdo \
php$PHP_VERSION-bz2 \
php$PHP_VERSION-mysqli \
apache2 \
libxml2-dev \
apache2-utils \
ca-certificates \
wget


RUN apk add --update --no-cache imagemagick-dev \
ffmpeg gimp
#RUN ln -s /usr/bin/php$PHP_VERSION /usr/bin/php
RUN curl -sS https://getcomposer.org/installer | php$PHP_VERSION -- --install-dir=/usr/bin --filename=composer 

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-php5-mongo/master/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-php5-mongo/releases/download/1.6.16-r0/php5-mongo-1.6.16-r0.apk
RUN apk add php5-mongo-1.6.16-r0.apk

RUN  rm -rf /var/cache/apk/*

# AllowOverride ALL
RUN sed -i '264s#AllowOverride None#AllowOverride All#' /etc/apache2/httpd.conf
#Rewrite Moduble Enable
RUN sed -i 's#\#LoadModule rewrite_module modules/mod_rewrite.so#LoadModule rewrite_module modules/mod_rewrite.so#' /etc/apache2/httpd.conf
# Document Root to /var/www/html/
RUN sed -i 's#/var/www/localhost/htdocs#/var/www/html#g' /etc/apache2/httpd.conf
#Start apache
RUN mkdir -p /run/apache2

RUN mkdir /var/www/html/

VOLUME  /var/www/html/
WORKDIR  /var/www/html/

EXPOSE 80
EXPOSE 443

CMD /usr/sbin/apachectl  -D   FOREGROUND