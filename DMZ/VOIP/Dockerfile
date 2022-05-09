# Version Ubuntu
FROM ubuntu:latest

# Asterisk

RUN apt update -y && apt upgrade -y
RUN apt install asterisk


# Récupération des fichiers dans le dossier de config
COPY config/extensions.conf /etc/asterisk/extensions.conf
COPY config/sip.conf /etc/asterisk/sip.conf
COPY config/users.conf /etc/asterisk/users.conf
COPY config/voicemail.conf /etc/asterisk/voicemail.conf

WORKDIR /etc/asterisk

EXPOSE 5060 5060/udp

CMD asterisk
