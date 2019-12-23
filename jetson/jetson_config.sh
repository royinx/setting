#lock the Watt 
sudo groupadd docker
sudo usermod -aG docker $USER

sudo jetson_clocks
#show the model 
# sudo nvpmodel -q
# default is MAX N mode (10W) , this mode have to connect DC 5V 4A, otherwise shut down. 
sudo nvpmodel -m 0
# change to 5W mode (micro-usb power supply)
# sudo nvpmodel -m 1

sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
ls -lh /swapfile
sudo mkswap /swapfile

sudo swapon /swapfile

sudo swapon -show
sudo bash -c 'echo "/var/swapfile swap swap defaults 0 0" >> /etc/fstab'

echo "export CUDA_HOME=/usr/local/cuda-10.0">>~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:$LD_LIBRARY_PATH">>~/.bashrc
echo "export PATH=/usr/local/cuda-10.0/bin:$PATH">>~/.bashrc

source ~/.bashrc

sudo -H pip3 install jetson-stats
sudo jtop
