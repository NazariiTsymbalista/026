# Ubuntu
FROM --platform=linux/amd64 ubuntu:latest

MAINTAINER nazarii.tsymbalista@gmail.com

ENV TZ=Europe/Kiev
ENV APACHE_RUN_DIR=

#Update 
RUN apt-get update
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y apache2 php libapache2-mod-php php-mysql curl mc

RUN set -ex; \
	curl -o latest.tar.gz -fSL "https://wordpress.org/latest.tar.gz"; \
	tar -xzf latest.tar.gz -C /tmp/; \
	rm latest.tar.gz; \
	chown -R www-data:www-data /tmp/wordpress; \
    touch /tmp/wordpress/.htaccess; \
    cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php; \
    mkdir /tmp/wordpress/wp-content/upgrade; \
    cp -a /tmp/wordpress/. /var/www/wordpress; \
    chown -R www-data:www-data /var/www/wordpress; \
    find /var/www/wordpress/ -type d -exec chmod 750 {} \;   

RUN find /var/www/wordpress/ -type f -exec chmod 640 {} \;
    
RUN cp -a /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/wordpress.conf; \
    sed -i '/<VirtualHost */ a <Directory /var/www/wordpress/> \nAllowOverride All \n</Directory>' /etc/apache2/sites-available/wordpress.conf; \
    sed -i "s/.*#ServerName.*/ServerName www.wordpress.com/" /etc/apache2/sites-available/wordpress.conf; \
    sed -i "s/.*ServerAdmin.*/ServerAdmin webmaster@localhost/" /etc/apache2/sites-available/wordpress.conf; \
    sed -i "s/.*ServerAlias.*/ServerAlias www.wordpress/" /etc/apache2/sites-available/wordpress.conf; \
    sed -i "s/.*DocumentRoot.*/DocumentRoot \/var\/www\/wordpress/" /etc/apache2/sites-available/wordpress.conf; \
    sed -i "s/.*ErrorLog.*/ErrorLog ${APACHE_LOG_DIR}\/error.log/" /etc/apache2/sites-available/wordpress.conf; \
    sed -i "s/.*CustomLog.*/CustomLog ${APACHE_LOG_DIR}\/access.log combined/" /etc/apache2/sites-available/wordpress.conf; \
    sed -i "s/.*DirectoryIndex index.*/DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm/" /etc/apache2/mods-available/dir.conf; \
    sed -i "s/.*define( 'DB_NAME',.*/define( 'DB_NAME', 'wordpress' );/" /var/www/wordpress/wp-config.php; \
    sed -i "s/.*define( 'DB_USER',.*/define( 'DB_USER', 'root' );/" /var/www/wordpress/wp-config.php; \
    sed -i "s/.*define( 'DB_PASSWORD',.*/define( 'DB_PASSWORD', 'wordpress' );/" /var/www/wordpress/wp-config.php; \
    sed -i "s/.*define( 'DB_HOST',.*/define( 'DB_HOST', 'mysql:3306' );/" /var/www/wordpress/wp-config.php; \
    sed -i '/mysql:3306 */ a define('FS_METHOD', 'direct');' /var/www/wordpress/wp-config.php
    
RUN a2enmod rewrite;    

RUN   a2ensite wordpress.conf; \
      a2dissite 000-default.conf
      
RUN service apache2 start;

# curl -s https://api.wordpress.org/secret-key/1.1/salt/    
    
CMD ["apachectl", "-D", "FOREGROUND"] 
# CMD tail -f /dev/null
