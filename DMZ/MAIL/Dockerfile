FROM ubuntu:latest
RUN apt-get update
RUN apt-get upgrade -y
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get install -y mutt dnsutils net-tools iputils-ping mailutils

RUN openssl req -new -x509 -days 3650 -nodes -newkey rsa:4096 -out /etc/ssl/certs/mailserver.pem -keyout /etc/ssl/private/mailserver.pem -subj "/C=BE/ST=Braban-wallon/O=Woodytoys/OU=IT/CN=mail.woodytoys.louisdewilde.be"

RUN apt-get install mysql-server -y

COPY SQL/create-db.sql config-sql/create-db.sql

RUN apt-get install -y postfix postfix-mysql

RUN groupadd -g 5000 vhosts && useradd -g vhosts -u 5000 vhosts -d /var/mail/vhosts -s /bin/false -m
COPY postfix/main.cf /etc/postfix/main.cf
COPY postfix/master.cf /etc/postfix/master.cf
COPY postfix/mysql-virtual-mailbox-domains.cf /etc/postfix/mysql-virtual-mailbox-domains.cf
COPY postfix/mysql-virtual-mailbox-maps.cf /etc/postfix/mysql-virtual-mailbox-maps.cf
COPY postfix/mysql-virtual-alias-maps.cf /etc/postfix/mysql-virtual-alias-maps.cf
COPY postfix/mysql-virtual-email2email.cf /etc/postfix/mysql-virtual-email2email.cf
COPY certs/woodytoys.louisdewilde.be/fullchain.pem /etc/letsencrypt/live/woodytoys.louisdewilde.be/fullchain.pem
COPY certs/woodytoys.louisdewilde.be/privkey.pem /etc/letsencrypt/live/woodytoys.louisdewilde.be/privkey.pem
COPY certs/mail.woodytoys.louisdewilde.be/fullchain.pem /etc/letsencrypt/live/mail.woodytoys.louisdewilde.be/fullchain.pem
COPY certs/woodytoys.louisdewilde.be/privkey.pem /etc/letsencrypt/live/mail.woodytoys.louisdewilde.be/privkey.pem
CMD ["mysqld"]
CMD ["postfix", "start-fg"]

RUN apt-get install -y dovecot-core dovecot-imapd dovecot-mysql
RUN apt-get install -y dovecot-sieve dovecot-managesieved
#
COPY dovecot/dovecot.conf /etc/dovecot/dovecot.conf
COPY dovecot/dovecot-sql.conf.ext /etc/dovecot/dovecot-sql.conf.ext
#
COPY dovecot/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
COPY dovecot/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
COPY dovecot/10-master.conf /etc/dovecot/conf.d/10-master.conf
#
COPY dovecot/auth-sql.conf.ext /etc/dovecot/conf.d/auth-sql.conf.ext
COPY dovecot/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf
#
#COPY dovecot/20-lmtp.conf /etc/dovecot/conf.d/20-lmtp.conf
#COPY dovecot/default.sieve /var/lib/dovecot/sieve/default.sieve
#
RUN sievec /var/lib/dovecot/sieve/default.sieve
RUN chown -R vhosts:vhosts /var/lib/dovecot/sieve/*
RUN chmod a+x /var/lib/dovecot