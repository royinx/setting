#!/bin/bash

#new installation and python
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y build-essential
sudo apt-get install -y make 
sudo apt-get dist-upgrade -y
sudo apt-get install -y python3-pip
sudo apt-get install -y libncursesw5-dev libgdbm-dev libc6-dev
sudo apt-get install -y zlib1g-dev libsqlite3-dev tk-dev
sudo apt-get install -y libssl-dev openssl
sudo apt-get install -y libffi-dev
sudo apt-get install -y net-tools

echo "alias py=python">>~/.bashrc
echo "alias docker_now='watch -n 0.5 docker ps'">>~/.bashrc
echo "alias docker_all='watch -n 0.5 docker ps -a'">>~/.bashrc
echo "alias mon1='watch -n 0.5 nvidia-smi'">>~/.bashrc
echo "alias mon2=htop">>~/.bashrc
echo "alias mon3='watch -n 0.5 sensors'">>~/.bashrc
echo "alias mem='sync && echo 3 | sudo tee /proc/sys/vm/drop_caches'">>~/.bashrc

