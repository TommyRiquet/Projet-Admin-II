RUN apt update -y
RUN apt apgrade -y
RUN apt-get update 
Run apt-get upgrade 

RUN apt-get install nano 
RUN apt install net-tools
RUN apt install dnsutils -y
RUN apt-get install iputils-ping -y
RUN apt install samba -y
RUN apt-get install smbclient -y
RUN apt install cifs-utils -y 
RUN apt install lunx -y 

COPY smb.conf /etc/samba/smb.conf

EXPOSE 136:136
EXPOSE 445:445

CMD tail -f /dev/null
