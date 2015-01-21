#!/usr/bin/env bash

echo " --- Hello Sir! --- "

echo " --- Update packages Lists --- "
sudo apt-get update

echo " --- Installing Base Packages --- "
sudo apt-get install -y unzip vim git-core curl wget build-essential python-software-properties

echo " --- It's Time For PHP Sir, now I am adding PHP repository --- "
sudo add-apt-repository -y ppa:ondrej/php5
sudo apt-get update
sudo apt-get install -y php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt mysql-server-5.5 php5-mysql git-core

echo "-- It's Time For MySQL Sir --"
sudo apt-get install -y mysql-server libapache2-mod-auth-mysql php5-mysql

echo " --- It's Time For Nginx Sir --- "
sudo add-apt-repository -y ppa:nginx/stable
sudo apt-get update
sudo apt-get install -y nginx

echo " --- It's Time For HHVM Sir --- "
wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
echo deb http://dl.hhvm.com/ubuntu trusty main | sudo tee /etc/apt/sources.list.d/hhvm.list
sudo apt-get update
sudo apt-get install -y hhvm

echo " --- I am doing what HHVM asked me to do Sir --- "
sudo /usr/share/hhvm/install_fastcgi.sh
sudo update-rc.d hhvm defaults
sudo service hhvm restart

echo " --- It's time for Composer Sir --- "
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo " --- Everything is done sir --- "
