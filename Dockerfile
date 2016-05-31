FROM ubuntu

RUN apt-get update && apt-get -y upgrade && apt-get -y install apache2 php7.0 php7.0-mysql libapache2-mod-php7.0 curl lynx-cur

ADD laravel.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod php7.0
RUN a2enmod rewrite

#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2
#ENV APACHE_LOCK_DIR /var/lock/apache2
#ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80
EXPOSE 443

ADD . /var/www/html

WORKDIR /var/www/html

CMD chmod 777 -R storage/
CMD chmod 777 -R bootstrap/cache

CMD /usr/sbin/apache2ctl -D FOREGROUND
