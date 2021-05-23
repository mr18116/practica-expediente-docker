#!/bin/bash
docker run --name nodo1 -d -p 91:80 web-expediente-medico
docker run --name nodo2 -d -p 92:80 web-expediente-medico