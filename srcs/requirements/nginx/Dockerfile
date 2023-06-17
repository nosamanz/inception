# FROM	debian:buster

# #install all the program
# RUN		apt-get update
# RUN		apt-get install -y nginx \
# 		openssl

# #nginx SSL
# RUN		mkdir -p /etc/nginx/ssl

# COPY	./conf/nginx.conf /etc/nginx/sites-enabled/default

# RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
# 			-out /etc/nginx/ssl/oozcan.crt \
# 			-keyout /etc/nginx/ssl/oozcan.key \
# 			-subj "/C=TR/ST=Kocaeli/L=Gebze/O=42 42Kocaeli/OU=oozcan/CN=oozcan/"

# EXPOSE 443

# RUN		mkdir -p /run/nginx
# #start nginx / daemon off olmasi arka planda calismasini kapatiyoruz
# #-g olmasi normalde config dosyasinin harici birseyi terminalde yapilandirma direktifi vermeyi saglar.
# CMD ["nginx", "-g", "daemon off;"]

FROM	debian:buster

RUN	apt-get update && apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default
COPY ./tools/nginx_start.sh /var/www

RUN chmod +x /var/www/nginx_start.sh
RUN mkdir -p /run/nginx

ENTRYPOINT ["var/www/nginx_start.sh"]

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
