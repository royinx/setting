#!/bin/bash

#htop
sudo apt-get install htop

echo 'alias py=python3' >> ~/.bashrc
echo 'alias mon1="watch -n 0.5 nvidia-smi"' >> ~/.bashrc
echo 'alias mon2=htop' >> ~/.bashrc
echo 'alias mon3="watch -n 0.5 sensors"' >> ~/.bashrc
. ~/.bashrc
