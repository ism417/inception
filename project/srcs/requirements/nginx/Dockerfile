# Description: Nginx Dockerfile

# pull the base image
FROM debian:12

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y 

# # install the required packages
RUN apt-get install -y nginx openssl \
    && rm -rf /var/lib/apt/lists/* 

# create the ssl directory
RUN mkdir -p /etc/nginx/ssl

# generate the ssl certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key -subj "/C=MO/ST=Tetuan/L=Martil/O=1337MED/CN=eismail.42.fr"

# copy the nginx configuration file
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# create the wordpress directory
RUN mkdir -p /var/www/wordpress

# change the owner of the wordpress directory to www-data
RUN chown -R www-data:www-data /var/www/wordpress


# define the command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]