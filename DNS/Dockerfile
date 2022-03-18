# Version Ubuntu
FROM ubuntu:latest

# BIND9 et outils

RUN apt update -y && apt upgrade -y
RUN apt install BIND9 bind9utils dnsutils net-tools -y


# Récupération des fichiers dans le dossier de config 

COPY named.conf /etc/bind/
COPY db.l2-7.ephec-ti.be /etc/bind

WORKDIR /etc/bind

EXPOSE 53/udp
EXPOSE 53/tcp

CMD tail -f /dev/null