# pull base image
FROM debian:12

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*

# # install the required packages
RUN apt-get install -y mariadb-server netcat-traditional

# copy file from host to container
COPY ./conf/mdb-conf.sh /mdb-conf.sh

# set permissions to the file
RUN chmod +x /mdb-conf.sh

# define entrypoint command to run when the container starts
ENTRYPOINT ["./mdb-conf.sh"]