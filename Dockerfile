FROM adrianharabula/php7-with-oci8

RUN pecl install xdebug-2.6.0
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini

RUN echo "<?php echo phpinfo(); ?>" > /var/www/html/phpinfo.php

EXPOSE 80