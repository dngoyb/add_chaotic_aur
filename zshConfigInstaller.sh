#!/bin/bash

# Install required packages
sudo pacman -S --needed --noconfirm zsh grml-zsh-config neofetch

# Install AUR packages using AUR helper (replace $AUR_HELPER with your AUR helper command)
yay -S --noconfirm --needed ttf-meslo-nerd siji-git ttf-unifont noto-color-emoji-fontconfig xorg-fonts-misc ttf-dejavu ttf-meslo-nerd-font-powerlevel10k noto-fonts-emoji powerline-fonts zsh-theme-powerlevel10k

# Wait for 2 seconds
sleep 2

# Grab Oh My Zsh & Plugins
echo "Step 2 - Grabbing OhMyZsh & Plugins"
echo "##################################"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Wait for 2 seconds
sleep 2

# Grab PowerLevel10k Theme
echo "Step 3 - Grabbing PowerLevel10k Theme"
echo "#####################################"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Download configuration files
cd $HOME/
wget https://raw.githubusercontent.com/xerolinux/xero-fixes/main/conf/.p10k.zsh
rm ~/.zshrc && wget https://raw.githubusercontent.com/xerolinux/xero-fixes/main/conf/.zshrc
mkdir -p ~/.config/neofetch && cd ~/.config/neofetch && wget https://raw.githubusercontent.com/xerolinux/xero-fixes/main/conf/config.conf

# Wait for 2 seconds
sleep 2

# Set default shell to Zsh
echo "Step 4 - Setting Default Shell to Zsh"
echo "#####################################"
sudo chsh $USER -s /bin/zsh

echo "#####################################"
echo "     Done! Now logout and log back in     "
echo "#####################################"
