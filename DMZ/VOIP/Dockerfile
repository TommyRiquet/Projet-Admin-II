# Version Ubuntu
FROM debian

# Asterisk
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install dnsutils net-tools asterisk -y

# Récupération des fichiers dans le dossier de config
COPY config/sip.conf /etc/asterisk/sip.conf
COPY config/users.conf /etc/asterisk/users.conf
COPY config/extensions.conf /etc/asterisk/extensions.conf
COPY config/voicemail.conf /etc/asterisk/voicemail.conf

EXPOSE 5060/tcp 5060/udp

ENTRYPOINT [ "/usr/sbin/asterisk", "-f" ]







