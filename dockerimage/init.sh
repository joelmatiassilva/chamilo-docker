#!/bin/bash

if [ "$(ls -A /var/www/html)" ]; then
   echo "Chamilo already installed - moving on."
   sudo chown -R root:root ./
   sudo chmod -R 0777 ./
else
   echo "Chamilo not installed - deploying."
   cd /var/www/html
   wget https://github.com/chamilo/chamilo-lms/releases/download/v1.11.8/chamilo-1.11.8-php7.tar.gz
   tar xvf chamilo-1.11.8-php7.tar.gz
   mv chamilo-1*/* ./
   rm -rf chamilo-1.11.8-php7.tar.gz
   rm -rf chamilo-1.11.8-php7
   sudo chown -R root:root ./
   sudo chmod -R 0777 ./
fi

/bin/bash -c 'a2enmod rewrite; apache2-foreground'
echo "****************** Chamilo not installed - Finalizo. ***********************"
