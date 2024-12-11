FROM debian:buster
#RUN apt update && apt install -y nginx
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server netcat

COPY ./script/mdb-script.sh /mdb-script.sh 

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /mdb-script.sh

ENTRYPOINT ["./mdb-script.sh"]