FROM debian:12
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Create proper nginx configuration
RUN echo "server {" > /etc/nginx/sites-available/default && \
    echo "    listen 80;" >> /etc/nginx/sites-available/default && \
    echo "    server_name _;" >> /etc/nginx/sites-available/default && \
    echo "    root /var/www;" >> /etc/nginx/sites-available/default && \
    echo "    index index.html;" >> /etc/nginx/sites-available/default && \
    echo "    location / {" >> /etc/nginx/sites-available/default && \
    echo "        try_files \$uri \$uri/ /index.html;" >> /etc/nginx/sites-available/default && \
    echo "    }" >> /etc/nginx/sites-available/default && \
    echo "}" >> /etc/nginx/sites-available/default

# Enable the site
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

COPY ./conf/* /var/www/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]