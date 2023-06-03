FROM	debian:latest

#install all the program
RUN		apt-get update
RUN		apt-get install -y nginx \
		openssl

#nginx SSL
RUN		mdkir /etc/nginx/ssl
RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
			-out /etc/nginx/ssl/oozcan.crt \
			-keyout /etc/nginx/ssl/oozcan.key \
			-subj "/C=TR/ST=Kocaeli/L=Gebze/O=42 42Kocaeli/OU=oozcan/CN=oozcan/"

COPY	./config/nginx.conf /etc/nginx/conf.d

#Bu komutun kullanılması, Nginx'in sorunsuz bir şekilde çalışabilmesi ve geçici dosyaları doğru şekilde yönetebilmesi için önemlidir.
RUN		mkdir -p /run/nginx

EXPOSE 443

#start nginx / daemon off olmasi arka planda calismasini kapatiyoruz
#-g olmasi normalde config dosyasinin harici birseyi terminalde yapilandirma direktifi vermeyi saglar.
CMD ["nginx", "-g", "daemon off;"]
