#!/bin/bash

docker stop examen_lab_dslhc && docker rm examen_lab_dslhc

docker build -t examen_lab_dslhc .

docker run -d --name examen_lab_dslhc -it examen_lab_dslhc

docker exec -it examen_lab_dslhc service mysql restart
docker exec -it examen_lab_dslhc service ssh restart
docker exec -it examen_lab_dslhc chmod +x script.sh
docker exec -it examen_lab_dslhc "./script.sh"
docker exec -it examen_lab_dslhc service vsftpd restart

docker exec -d -it examen_lab_dslhc flask run --host=0.0.0.0

ip_address=$(docker container inspect examen_lab_dslhc | grep -i "ipaddress" | tr ' ' '\n'  | tr -d '",' | grep -E "[0-9]+" | sort -u)

echo "[+] La ip es: $ip_address"