FROM ubuntu:22.04

RUN apt-get update && apt-get install -y vsftpd && apt-get install -y python3 && apt-get install -y python3-pip
# Install the required packages
RUN apt-get update && \
    apt-get install -y mysql-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip install PyJWT
RUN pip install flask

RUN apt-get install -y iputils-ping

WORKDIR /app

COPY . /app

ENV FLASK_APP=/app/app.py
ENV FLASK_ENV=development

RUN rm /etc/vsftpd.conf

COPY vsftpd.conf /etc/

RUN mkdir /var/ftp

COPY message.txt /var/ftp/

ENV MYSQL_ROOT_PASSWORD=37ey782b3bg36dbgfzgs




# CMD [ "flask", "run", "--host=0.0.0.0" ]