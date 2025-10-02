# inception
Architecture Overview
1. MariaDB (Database Layer)
Role:

Stores all WordPress data (posts, users, settings, etc.)
Runs on port 3306 internally
Uses mariadb for persistent storage
Healthcheck ensures it's ready before WordPress starts
2. WordPress (Application Layer)
Role:

PHP application that processes dynamic content
Connects to MariaDB using service name mariadb:3306
Stores website files in /var/www/wordpress
Waits for MariaDB to be healthy before starting
3. Nginx (Web Server Layer)
Role:

Web server that handles HTTPS requests from internet
Serves static files (CSS, JS, images) directly
Forwards PHP requests to WordPress container
Acts as reverse proxy
Communication Flow
User Request: Browser makes HTTPS request to port 443
Nginx Processing:
Serves static files directly from shared volume
Forwards PHP requests to wordpress container
WordPress Processing:
Executes PHP code
Queries database at mariadb:3306
MariaDB Response: Returns data to WordPress
Response Chain: WordPress → Nginx → User
Network Communication
All containers communicate on the inception network:

nginx → wordpress: HTTP requests (internal)
wordpress → mariadb: MySQL queries on port 3306
Service discovery works by container names
Shared Storage
Both Nginx and WordPress mount the same volume, allowing:

Nginx to serve static files
WordPress to write uploaded files
Shared access to WordPress installation files
This creates a typical LEMP stack (Linux, Nginx, MySQL/MariaDB, PHP) architecture with container isolation and persistent data storage.
