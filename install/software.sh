#!/usr/bin/env bash

# pulseaudio
sh install_pulseaudio

# Thunar
sudo pacman -S --noconfirm thunar

# powerline fonts
sudo pacman -S --noconfirm powerline-fonts

# zsh
sudo pacman -S --noconfirm zsh

# postgres
sudo pacman -S --noconfirm postgresql

# Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# terminator
sudo pacman -S --noconfirm terminator

# Google chrome
yaourt -S --noconfirm google-chrome

# Firefox
sudo pacman -S --noconfirm firefox

# mailspring
yaourt -S --noconfirm mailspring

# Franz
yaourt -S --noconfirm franz

# atom
sudo pacman -S --noconfirm atom

# IntelliJ IDEA
yaourt -S --noconfirm intellij-idea-ultimate-edition

# Spotify
yaourt -S --noconfirm spotify

# Dropbox
yaourt -S --noconfirm dropbox

# Skype
yaourt -S --noconfirm skypeforlinux-stable-bin

# meld
sudo pacman -S --noconfirm meld

# Gpick color picker
sudo pacman -S --noconfirm gpick

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# Enable Ledger Nano S: http://support.ledgerwallet.com/knowledge_base/topics/ledger-wallet-is-not-recognized-on-linux
wget -q -O - https://www.ledgerwallet.com/support/add_udev_rules.sh | sudo bash

# zsh stuff
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# FontAwesome
sudo pacman -S --noconfirm ttf-font-awesome

# paper fonts
sudo pacman -S --noconfirm paper-icon-theme

# i3
sudo pacman -S --noconfirm i3blocks
sudo pacman -S --noconfirm compton
sudo pacman -S --noconfirm rofi
sudo pacman -S --noconfirm feh
sudo pacman -S --noconfirm arandr
sudo pacman -S --noconfirm lxappearance
