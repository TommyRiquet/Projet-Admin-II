FROM php:8.0-apache


RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN echo 'SetEnv MYSQL_USER ${MYSQL_USER}'
RUN echo 'SetEnv MYSQL_PSW ${MYSQL_PSW}'
RUN echo 'SetEnv MAIN_DOMAIN ${MAIN_DOMAIN}'
RUN apt-get -y update
RUN apt-get install -y nano
RUN apt-get install -y ssl-cert
RUN apt-get install -y net-tools bind9 bind9utils dnsutils iputils-ping

#Set pre existing log if exist + create the dirrectory
COPY www/WoodyToys/b2b/b2b_errors.log /var/log/apache2/WoodyToys_error_logs/b2b/b2b_errors.log
COPY www/WoodyToys/www/vitrine_errors.log /var/log/apache2/WoodyToys_error_logs/vitrine/vitrine_errors.log

#Coping files for www and b2b
COPY www/WoodyToys/www/index.html /var/www/html/WoodyToys/www/index.html
COPY www/WoodyToys/www/WoodyToys-vitrine.css /var/www/html/WoodyToys/www/css/WoodyToys-vitrine.css
COPY www/WoodyToys/b2b/WoodyToys-B2B.php /var/www/html/WoodyToys/b2b/index.php
COPY www/WoodyToys/b2b/css/ /var/www/html/WoodyToys/b2b/css/

#Coping Configs
COPY config/apache2.conf /etc/apache2/apache2.conf
COPY config/sites-available/WoodyToys-www.conf /etc/apache2/sites-available/WoodyToys-www.conf
COPY config/sites-available/WoodyToys-B2B.conf /etc/apache2/sites-available/WoodyToys-B2B.conf

COPY security/b2b/ /etc/apache2/ssl/b2b
COPY security/www/ /etc/apache2/ssl/www


#Desactivating default vhost and activating ours
RUN a2dissite 000-default.conf
RUN a2ensite WoodyToys-B2B.conf
RUN a2ensite WoodyToys-www.conf
RUN a2enmod ssl
RUN a2enmod rewrite
