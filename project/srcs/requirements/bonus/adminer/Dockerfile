FROM debian:12

# Update package list and install required packages
RUN apt-get update && apt-get install -y \
    php8.2 \
    php8.2-cli \
    php8.2-mysql \
    php8.2-pgsql \
    php8.2-sqlite3 \
    php8.2-mbstring \
    php-json \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create web directory
RUN mkdir -p /var/www/wordpress

# Download Adminer
RUN wget -O /var/www/wordpress/index.php https://www.adminer.org/latest.php

# Create non-root user
RUN useradd -r -s /bin/false adminer

# Set permissions for adminer user
RUN chown -R adminer:adminer /var/www/wordpress

# Switch to non-root user
USER adminer

# Expose port
EXPOSE 8080

# Start PHP built-in server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/wordpress"]