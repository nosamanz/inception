FROM debian:latest

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

COPY ./config/server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

#image olusturma sirasinda calistirilacak
RUN service mysql start
RUN mysql < /var/www/initial_db.sql && rm -f /var/www/initial_db.sql

CMD ["mysql"]
