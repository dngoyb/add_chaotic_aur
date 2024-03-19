 
#!/bin/bash

# Install Chaotic-AUR keyring and mirrorlist
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Add Chaotic-AUR repository to pamac.conf
echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf

# Optionally install powerpill for parallel downloads
sudo pacman -Sy --noconfirm powerpill

# Update package databases and perform system updates
sudo pacman -Sy --noconfirm
sudo powerpill -Su --noconfirm

echo "Chaotic-AUR repository has been added successfully!"

# Adding most used softwares 
sudo pacman -S --noconfirm visual-studio-code-bin vscodium spotify-adblock-git freetube vlc qbittorrent audacious gparted chatgpt-desktop-bin terminator obsidian quickemu auto-cpufreq 

# Adding software via yay
yay -S --nonconfirm quickgui

# Adding snapper
sudo pacman -S --noconfirm btrfs-assistant grub-btrfs snapper snapper-support

sudo snapper -c root create-config /

snapper -c root create --description "initial snapshot"

sudo chmod a+rx /.snapshots
sudo chown :user /.snapshots

# Adding Portmaster
sudo pacman -S --noconfirm portmaster-stub-bin

