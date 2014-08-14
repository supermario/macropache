#!/bin/sh

# Install Apache mod_macro
sudo apt-get install libapache2-mod-macro
sudo a2enmod macro

# Symlink macros into the Apache conf.d folder
sudo ln -s `pwd`/apache/macros.conf /etc/apache2/conf.d/macros.conf

# Add environment variables required for macros
read -r -p "Enter ServerAdmin email: " server_admin
echo -e "\nexport APACHE_ADMIN_EMAIL="$server_admin | sudo tee -a /etc/apache2/envvars
echo -e "\nexport APACHE_DEFAULT_PORT=80" | sudo tee -a /etc/apache2/envvars

# Restart apache2
sudo service apache2 restart
