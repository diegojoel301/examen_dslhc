#!/bin/bash

docker stop examen_lab_dslhc
docker rm examen_lab_dslhc

docker build -t examen_lab_dslhc

docker run -it examen_lab_dslhc --name examen_lab_dslhc

docker exec -it examen_lab_dslhc "service mysql restart"
docker exec -it examen_lab_dslhc "./script.sh"
