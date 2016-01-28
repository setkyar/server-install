#!/bin/sh bash

echo "Yo! I will install Composer/HHVM/Nginx for ubuntu 14.04!"

echo "Let me install essentials"

sudo apt-get update
sudo apt-get install -y unzip vim git-core curl wget build-essential python-software-properties

echo "Time For Composer"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "Time For Nginx"
sudo add-apt-repository -y ppa:nginx/stable
sudo apt-get update
sudo apt-get install -y nginx

echo "Time For HHVM"
wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
echo deb http://dl.hhvm.com/ubuntu trusty main | sudo tee /etc/apt/sources.list.d/hhvm.list
sudo apt-get update
sudo apt-get install -y hhvm

echo "Let me run what HHVM said"
sudo /usr/share/hhvm/install_fastcgi.sh # This restarts Nginx for us
sudo update-rc.d hhvm defaults
sudo service hhvm restart
sudo /usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60

echo "Mostly working fine now! There was HHVM Nginx configuration simple is in this repo too."
echo "Check by running 'ls'."

echo "Hello buddy! Love Yeah <3 Bye!"