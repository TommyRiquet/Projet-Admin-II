# Version Ubuntu
FROM ubuntu:latest

# BIND9 et outils

RUN apt update -y && apt upgrade -y
RUN apt install bind9 bind9utils dnsutils net-tools -y


# Récupération des fichiers dans le dossier de config
COPY config/named.conf /etc/bind/named.conf
COPY config/named.conf.options /etc/bind/named.conf.options
COPY config/named.conf.default-zones /etc/bind/named.conf.default-zones
COPY config/named.conf.local /etc/bind/named.conf.local
COPY config/db.l2-7.ephec-ti.be /etc/bind/db.l2-7.ephec-ti.be


WORKDIR /etc/bind

EXPOSE 53/udp
EXPOSE 53/tcp

CMD named -c /etc/bind/named.conf -g
CMD tail -f /dev/null
