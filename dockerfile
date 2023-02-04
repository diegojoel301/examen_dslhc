FROM ubuntu:latest

RUN apt-get update && apt-get -y upgrade && apt-get install -y vsftpd && apt-get install -y python3 && apt-get install -y python3-pip

RUN pip install PyJWT
RUN pip install flask
RUN pip install mysql-connector-python

RUN apt-get install -y iputils-ping


ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y mysql-server

WORKDIR /app

COPY . /app/.

ENV FLASK_APP=/app/app.py
ENV FLASK_ENV=development

# Configuracion server mysql
#RUN rm /etc/my.cnf
COPY my.cnf /etc/my.cnf

RUN cat /etc/my.cnf

RUN service mysql restart
#RUN mysql < db.sql

#RUN cat /etc/my.cnf

RUN rm /etc/vsftpd.conf

COPY vsftpd.conf /etc/

RUN mkdir /var/ftp

COPY message.txt /var/ftp/

EXPOSE 22
EXPOSE 21

RUN apt-get install -y openssh-server

RUN adduser --disabled-password --gecos '' mago
RUN echo "mago:minecraft" | chpasswd

RUN su -c "ssh-keygen -f /home/mago/.ssh/id_rsa -t rsa -N ''" - mago
#RUN su mago -c "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin; ssh-keygen -f /home/mago/.ssh/id_rsa -t rsa -N ''"
RUN chmod u+s /usr/bin/python3
