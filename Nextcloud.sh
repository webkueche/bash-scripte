# Upgrade Distro & Install apache
apt update && apt upgrade -y && apt autoremove && apt autoclean && apt install apache2 -y

# Install repositorys & update
apt install software-properties-common && add-apt-repository ppa:ondrej/php && apt update && apt upgrade -y

# Install PHP 8.3 & Moduls
apt install php8.3 libapache2-mod-php8.3 php8.3-zip php8.3-xml php8.3-mbstring php8.3-gd php8.3-curl php8.3-imagick libmagickcore-6.q16-6-extra php8.3-intl php8.3-bcmath php8.3-gmp php8.3-cli php8.3-mysql php8.3-zip php8.3-gd php8.3-mbstring php8.3-curl php8.3-xml php-pear unzip nano php8.3-apcu redis-server ufw php8.3-redis php8.3-smbclient php8.3-ldap php8.3-bz2 php8.3-sqlite3 

# Adjust PHP.ini
nano /etc/php/8.3/apache2/php.ini
memory_limit = 8192M
upload_max_filesize = 20G
post_max_size = 20G
date.timezone = Europe/Berlin

output_buffering = Off
opcache.enable=1
opcache.enable_cli=1
opcache.memory_consumption=2048
opcache.interned_strings_buffer=64
opcache.max_accelerated_files=10000
opcache.save_comments=1
opcache.revalidate_freq=1

# install Maria DB
apt install mariadb-server -y

# maria DB Konfiguration
mysql_secure_installation

# open SQL dialog
mysql

# create database calles nextcloud
CREATE DATABASE nextcloud; 

# create database user with password
CREATE USER 'nextclouduser'@'localhost' IDENTIFIED BY 'rgerbregergerg';
#grant accesss to databse
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextclouduser'@'localhost';
#save changes and exit
FLUSH PRIVILEGES;
EXIT;
# Download nextcloud:lastest
cd /tmp && wget https://download.nextcloud.com/server/releases/latest.zip
unzip latest.zip
mv nextcloud /var/www/

#Create nextcloud.conf

nano /etc/apache2/sites-available/nextcloud.conf

<VirtualHost *:80>
     ServerAdmin admin@rgrg.com
     DocumentRoot /var/www/nextcloud/
     ServerName nextcloud.rgrgrgr.com

     <Directory /var/www/nextcloud/>
        Options +FollowSymlinks
        AllowOverride All
        Require all granted
          <IfModule mod_dav.c>
            Dav off
          </IfModule>
        SetEnv HOME /var/www/nextcloud
        SetEnv HTTP_HOME /var/www/nextcloud
     </Directory>

     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
 
# Enable the NextCloud and Rewrite Module
a2ensite nextcloud.conf
a2enmod rewrite
a2enmod headers
a2enmod env
a2enmod dir
a2enmod mime

# Restart apache
service apache2 restart

# Data folder
mkdir /home/data/
chown -R www-data:www-data /home/data/
chown -R www-data:www-data /var/www/nextcloud/
chmod -R 755 /var/www/nextcloud/

## Nextcloud Cronjob ##
crontab -u www-data -e
*/1  *  *  *  * php -f /var/www/nextcloud/cron.php
