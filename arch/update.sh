sudo pacman -Sy --noconfirm bash-completion git base-devel docker-compose

# 安裝 yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# 4090 nvidia driver
sudo pacman -Sy nvidia-open
# yay -S nvidia-580xx-utils --noconfirm

yay -S nvidia-container-toolkit
sudo systemctl restart docker
docker run --rm --gpus all python:3.11-slim nvidia-smi

# monitor
sudo pacman -Sy --noconfirm htop
echo "alias mon1='watch -n 0.5 nvidia-smi'">>~/.bashrc
echo "alias mon2=htop">>~/.bashrc