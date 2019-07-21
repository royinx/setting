#!/bin/bash

wget https://github.com/lutzroeder/netron/releases/download/v3.2.8/netron_3.2.8_amd64.deb
sudo apt -y install ./netron_3.2.8_amd64.deb 
sudo apt -y autoremove
rm netron_3.2.8_amd64.deb

