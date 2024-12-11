FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl php php7.4-fpm php-mysql mariadb-client wget vim zsh git netcat mycli

COPY /conf/wp_script.sh /

RUN  chmod +x wp_script.sh

ENTRYPOINT ["./wp_script.sh"]