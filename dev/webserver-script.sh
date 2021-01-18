#!/bin/bash

#############################################################
####### WEB SERVER SCRIPT FOR NODEJS APPLICATION #################
#############################################################

# Get Admin Privileges

sudo su

# Install Apache2 Web Server 

apt update -y
apt install awscli -y
apt install nodejs
git clone https://github.com/kapilkumaria/Dev-Project1.git
apt install npm
npm install
npm start