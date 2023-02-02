FROM ubuntu:latest

RUN apt-get update && apt-get install -y vsftpd && apt-get install -y python3 && apt-get install -y python3-pip

RUN pip install PyJWT
RUN pip install flask

RUN apt-get install -y iputils-ping

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

CMD [ "flask", "run", "--host=0.0.0.0" ]
