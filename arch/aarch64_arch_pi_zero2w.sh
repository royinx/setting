lsblk

mkdir install
cd install 


sudo fdisk /dev/sde

# o             Type o. This will clear out any partitions on the drive.
# p             Type p to list partitions. There should be no partitions left.
# n p 1 _ +1G   Type n, then p for primary, 1 for the first partition on the drive, press ENTER to accept the default first sector, then type +1G for the last sector.
# t c           Type t, then c to set the first partition to type W95 FAT32 (LBA).
# n p 2 _ _     Type n, then p for primary, 2 for the second partition on the drive, and then press ENTER twice to accept the default first and last sector.
# w             Write the partition table and exit by typing w.



sudo mkfs.vfat /dev/sde1
mkdir boot
sudo mount /dev/sde1 boot

sudo mkfs.ext4 /dev/sde2
mkdir root
sudo mount /dev/sde2 root

wget http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-aarch64-latest.tar.gz
sudo su
bsdtar -xpf ArchLinuxARM-rpi-aarch64-latest.tar.gz -C root
sync

mv root/boot/* boot

sed -i 's/mmcblk0/mmcblk1/g' root/etc/fstab
umount boot root
exit

rm -rf ./*
cd ..