# Description: Wordpress Dockerfile

# pull the base image
FROM debian:12

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*

# install the required packages
RUN apt-get install -y curl php php-fpm php-mysql mariadb-client

# copy the wordpress configuration script to the root directory in the container
COPY ./conf/wp_conf.sh /

# change the permission of the script to make it executable
RUN  chmod +x wp_conf.sh

# define the entrypoint command to run when the container starts
ENTRYPOINT ["./wp_conf.sh"]