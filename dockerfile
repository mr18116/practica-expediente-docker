FROM debian:stable-slim
LABEL CARNET="MR18116"
LABEL NOMBRE="NOÉ FRANCISCO MARTÍNEZ RUÍZ"
RUN apt update && apt install -y curl git nginx \
&& curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
&&  apt-get install -y nodejs \
&& npm install -g @quasar/cli \
&& git clone https://github.com/diseno2021/expedientemedico.git\
&& cd expedientemedico && git checkout v1.0 \
&& npm install && quasar build \
&& rm /var/www/html/index.nginx-debian.html && cd dist/spa \
&& cp -r . /var/www/html/ 

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
