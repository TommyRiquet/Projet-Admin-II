# Version Ubuntu
FROM ubuntu:latest

# Asterisk

RUN apt update -y && apt upgrade -y
RUN apt install asterisk


# Récupération des fichiers dans le dossier de config
COPY config/ /etc/asterisk/

WORKDIR /etc/asterisk

EXPOSE 5060 5060/udp

CMD asterisk
