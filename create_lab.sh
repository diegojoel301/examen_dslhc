#!/bin/bash

docker stop examen_lab_dslhc && docker rm examen_lab_dslhc

docker build -t examen_lab_dslhc .

docker run -d --name examen_lab_dslhc -it examen_lab_dslhc

docker exec -it examen_lab_dslhc service mysql restart
docker exec -it examen_lab_dslhc chmod +x script.sh
docker exec -it examen_lab_dslhc "./script.sh"
