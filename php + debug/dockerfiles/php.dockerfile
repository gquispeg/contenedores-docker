FROM php:8.3-rc-apache
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y libxml2 libxml2-dev ghostscript libxslt-dev libzip-dev libxslt1-dev && docker-php-ext-install zip
RUN apt-get install unzip
RUN pear install -a SOAP-0.13.0 && docker-php-ext-install soap;
RUN pecl install xdebug-3.4.1 libxml2-dev && docker-php-ext-enable xdebug
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install xsl 
RUN apt-get install -y libmagickwand-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
#RUN pecl install imagick-3.7.0 && docker-php-ext-enable imagick

RUN a2enmod rewrite
#RUN docker-php-ext-install soap && docker-php-ext-enable soap
RUN chown -R www-data:www-data /var/www/html
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#RUN mkdir /var/run/sshd
#RUN echo 'root:root123' | chpasswd
#RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 80
#CMD ["/usr/sbin/sshd", "-D"]

