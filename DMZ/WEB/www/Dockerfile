FROM php:8.0-apache


RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN echo 'SetEnv MYSQL_USER ${MYSQL_USER}'
RUN echo 'SetEnv MYSQL_PSW ${MYSQL_PSW}'
RUN echo 'SetEnv MAIN_DOMAIN ${MAIN_DOMAIN}'
RUN apt-get -y update
RUN apt-get install -y nano
RUN apt-get install -y net-tools bind9 bind9utils dnsutils iputils-ping

#Set pre existing log if exist + create the dirrectory
COPY www/WoodyToys/b2b/b2b_errors.log /var/log/apache2/WoodyToys_error_logs/b2b/b2b_errors.log
COPY www/WoodyToys/vitrine/vitrine_errors.log /var/log/apache2/WoodyToys_error_logs/vitrine/vitrine_errors.log

#Coping files for www and b2b
COPY www/WoodyToys/vitrine/index.html /var/www/html/WoodyToys/vitrine/index.html
COPY www/WoodyToys/vitrine/WoodyToys-vitrine.css /var/www/html/WoodyToys/vitrine/css/WoodyToys-vitrine.css
COPY www/WoodyToys/b2b/WoodyToys-B2B.php /var/www/html/WoodyToys/b2b/index.php
COPY www/WoodyToys/b2b/css/ /var/www/html/WoodyToys/b2b/css/

#Coping Configs
COPY config/apache2.conf /etc/apache2/apache2.conf
COPY config/sites-available/WoodyToys-vitrine.conf /etc/apache2/sites-available/WoodyToys-vitrine.conf
COPY config/sites-available/WoodyToys-B2B.conf /etc/apache2/sites-available/WoodyToys-B2B.conf
#Desactivating default vhost and activating ours
RUN a2dissite 000-default.conf
RUN a2ensite WoodyToys-B2B.conf
RUN a2ensite WoodyToys-vitrine.conf
RUN a2enmod ssl
RUN a2enmod rewrite