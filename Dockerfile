FROM adrianharabula/php7-with-oci8

RUN pecl install xdebug-2.6.0
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.max_nesting_level=250" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.profiler_enable=1" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.profiler_enable_trigger=1" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.profiler_output_name=xdebug_trace.%t" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.profiler_output_dir=/var/log/" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.remote_port=9000" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.show_exception_trace=0" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.show_local_vars=0" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.var_display_max_data=10000" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.var_display_max_depth=20" >> /usr/local/etc/php/php.ini
RUN echo "xdebug.idekey = 'PHPSTORM'" >> /usr/local/etc/php/php.ini

RUN echo "<?php echo phpinfo(); ?>" > /var/www/html/phpinfo.php

EXPOSE 80