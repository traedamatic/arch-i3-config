# set time
timedatectl set-ntp true

sgdisk -n 1:34:1050624 -t 1:ef00 /dev/sda
sgdisk -n 2:1050625:500118158 -t 2:8e00 /dev/sda
sgdisk -p /dev/sda

cryptsetup luksFormat /dev/sda2
cryptsetup open /dev/sda2 cryptlvm

pvcreate /dev/mapper/cryptolvm
vgcreate TheDisk /dev/mapper/cryptolvm

lvcreate -L 8G TheDisk -n swap
lvcreate -L 50G TheDisk -n root
lvcreate -l 100%FREE TheDisk -n home

mkfs.ext4 /dev/mapper/TheDisk-root
mkfs.ext4 /dev/mapper/TheDisk-home
mkswap /dev/mapper/TheDisk-swap

mount /dev/mapper/TheDisk-root /mnt
mkdir /mnt/home
mount /dev/mapper/TheDisk-home /mnt/home
swapon /dev/mapper/TheDisk-swap

mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacman-key --populate archlinux
pacman-key --refresh-keys

pacstrap /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime

hwclock --systohc

#TODO: Uncomment en_US.UTF-8 UTF-8 and other needed localizations in /etc/locale.gen, and generate them with: AUTOMATIC
locale-gen

#TODO: Add the keyboard, encrypt and lvm2 hooks to mkinitcpio.conf: AUTOMATIC

mkinitcpio -p linux

passwd

bootctl --path=/boot install

#TODO create conf for bootctl
# in /boot/loader/loader.conf
#default  arch
#timeout  4

#TODO: create entry for boot loader
# in /boot/loader/entries/arch.conf
#title Arch Linux Encrypted
#linux /vmlinuz-linux
#initrd /initramfs-linux.img
#options cryptdevice=UUID=<UUID>:<mapped-name> root=/dev/mapper/<mapped-name> quiet rw
