#!/bin/bash

#####################################################################
##### USE THIS WITH PROJECT-2 DEPLOY JENKINS WITH TERRAFORM ########
#####################################################################

# get admin privileges 

sudo su

# install apache2 webserver

apt update -y
apt install apache2 -y
service apache2 start
service apache2 enable
cp dir.conf /etc/apache2/mods-enabled/dir.conf
cp 000-default.conf /etc/apache2/sites-enabled/000-default.conf
apt install nodejs -y
apt install npm -y
npm install
cd /var/www/html
git clone https://github.com/kapilkumaria/Dev-Project1.git
cd Dev-Project1
service apache2 start
npm start