#!/bin/bash

sudo apt-get install -y openssh-server 
sudo systemctl enable ssh
sudo ufw allow ssh
